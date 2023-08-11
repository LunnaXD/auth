import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/core.dart';
import 'di/di.dart';
import 'presentation/presentation.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>()..loadApp()),
        BlocProvider(create: (_) => getIt<SettingsCubit>()..getSettings()),
      ],
      child: ScreenUtilInit(
        /// Set screen size to make responsive
        /// Almost all device
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, __) {
          /// Pass context to appRoute
          AppRoute.setStream(context);

          return BlocBuilder<SettingsCubit, SettingsState>(
            buildWhen: (p, c) =>
                p.activeTheme != c.activeTheme ||
                p.activeLanguage != c.activeLanguage,
            builder: (_, state) => MaterialApp.router(
              routerConfig: AppRoute.router,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: L10n.all,
              debugShowCheckedModeBanner: false,
              title: "Constants.get.appName",
              theme: themeLight(context),
              darkTheme: themeDark(context),
              locale: Locale(state.activeLanguage.name),
              themeMode: state.activeTheme.mode,
              // useMaterial3: true,
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);

                return MediaQuery(
                  data: data.copyWith(
                    textScaleFactor: 1,
                    alwaysUse24HourFormat: true,
                  ),
                  child: child!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
