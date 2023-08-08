import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../blocs/blocs.dart';
import '../../models_forms/models_forms.dart';
import '../../widgets/widgets.dart';
import 'sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootScaffold(
      child: BlocProvider<SignInFormBloc>(
        create: (context) => getIt<SignInFormBloc>(),
        child: BlocListener<SignInFormBloc, SignInFormState>(
          listener: (context, state) {
            if (state.status == FormStatus.submissionSuccess) {
              context.read<AuthCubit>().loadApp();
            }
          },
          child: SignInForm(),
        ),
      ),
    );
  }
}
