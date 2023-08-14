import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../di/di.dart';
import '../../utils/utils.dart';
import '../blocs/blocs.dart';
import '../pages/pages.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  // Auth Page
  login("/auth/login"),
  // register("/auth/register"),

  /// Home Page
  dashboard("/dashboard"),
  settings("/settings"),
  ;

  const Routes(this.path);

  final String path;
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (context, state) => const SplashScreenPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (context, state) => Routes.dashboard.path,
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const SignInPage(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, __, child) => BlocProvider<MainMenuCubit>(
          create: (context) => getIt<MainMenuCubit>(),
          child: MainPage(child: child),
        ),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: Routes.dashboard.path,
            name: Routes.dashboard.name,
            builder: (_, __) =>
                const DashboardPage() /*MultiBlocProvider(
              providers: [
                // getIt<UsersCubit>()
                //   ..fetchUsers(const UsersParams()),
              ],
              child: const DashboardPage(),
            )*/
            ,
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: Routes.settings.path,
            name: Routes.settings.name,
            builder: (_, __) => const SettingsPage(),
          ),
        ],
      ),
    ],
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: RefreshListenable(context.read<AuthCubit>().stream),
    redirect: (BuildContext context, GoRouterState state) {
      final bool isAuthenticated =
          context.read<AuthCubit>().state.status.isAuthenticated;

      if (!(isAuthenticated ||
          context.read<AuthCubit>().state.status.isUnauthenticated)) {
        return null;
      }

      final bool isLoginPage = state.subloc == Routes.login.path;
      // || state.subloc == Routes.register.path;
      final bool isSplashPage = state.subloc == Routes.splashScreen.path;

      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!isAuthenticated) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page
      if ((isLoginPage || isSplashPage) && isAuthenticated) {
        return Routes.root.path;
      }

      /// No direct
      return null;
    },
  );
}
