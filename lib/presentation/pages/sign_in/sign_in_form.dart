import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../blocs/blocs.dart';
import '../../models_forms/models_forms.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';

class SignInForm extends StatelessWidget {
  /// Focus Node
  final _fnUsername = FocusNode();
  final _fnPassword = FocusNode();

  //keys
  static const _keyUsername = Key("username");
  static const _keyPassword = Key("password");

  SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.space24),
          child: AutofillGroup(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Palette.primary,
                    radius: Dimens.profilePicture + Dimens.space4,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Images.icLauncher),
                      radius: Dimens.profilePicture,
                    ),
                  ),
                  const SpacerVertical(),
                  const _FailureMessage(),
                  _UsernameInput(
                    fnPassword: _fnUsername,
                    fnUsername: _fnPassword,
                  ),
                  _PasswordInput(
                    fnPassword: _fnUsername,
                    fnUsername: _fnPassword,
                    onEditingComplete: () =>
                        _onSignInWithEmailAndPasswordPressed(context),
                  ),
                  SpacerVertical(value: Dimens.space24),
                  _SignInButton(
                    onSignInWithEmailAndPasswordPressed: () =>
                        _onSignInWithEmailAndPasswordPressed(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSignInWithEmailAndPasswordPressed(BuildContext context) {
    context
        .read<SignInFormBloc>()
        .add(const SignInWithEmailAndPasswordPressed());
  }
}

class _FailureMessage extends StatelessWidget {
  const _FailureMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      buildWhen: (previous, current) => previous.failure != current.failure,
      builder: (context, state) {
        if (!state.status.isSubmissionFailure) {
          return const SizedBox();
        }
        return Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimens.space24),
            child: Text(
              state.failureMessage(context) ?? '-',
              style: const TextStyle(color: Palette.red),
            ),
          ),
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  final FocusNode? fnUsername;
  final FocusNode? fnPassword;

  const _UsernameInput({Key? key, this.fnUsername, this.fnPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      buildWhen: (previous, current) =>
          previous.form.username != current.form.username ||
          previous.autoValidate != current.autoValidate,
      builder: (context, state) {
        return InputText(
          autofillHints: const [AutofillHints.email],
          key: SignInForm._keyUsername,
          currentFocusNode: fnUsername,
          nextFocusNode: fnPassword,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.alternate_email,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          labelText: Strings.of(context)!.username,
          hintText: Strings.of(context)!.hintUsername,
          errorText: state.usernameError(context),
          onChanged: (value) =>
              context.read<SignInFormBloc>().add(UserNameChanged(value)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final FocusNode? fnUsername;
  final FocusNode? fnPassword;
  final VoidCallback onEditingComplete;

  const _PasswordInput(
      {Key? key,
      required this.fnUsername,
      required this.fnPassword,
      required this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      buildWhen: (previous, current) =>
          previous.form.password != current.form.password ||
          previous.hidePassword != current.hidePassword ||
          previous.autoValidate != current.autoValidate,
      builder: (context, state) {
        return InputText(
          autofillHints: const [AutofillHints.password],
          key: SignInForm._keyPassword,
          currentFocusNode: fnPassword,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          obscureText: state.hidePassword,
          labelText: Strings.of(context)!.password,
          hintText: Strings.of(context)!.hintPassword,
          maxLine: 1,
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              context.read<SignInFormBloc>().add(const HidePasswordChanged());
            },
            icon: Icon(
              state.hidePassword ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          errorText: state.passwordError(context),
          onChanged: (value) =>
              context.read<SignInFormBloc>().add(PasswordChanged(value)),
          onEditingComplete: onEditingComplete,
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  final VoidCallback onSignInWithEmailAndPasswordPressed;

  const _SignInButton(
      {Key? key, required this.onSignInWithEmailAndPasswordPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Button(
                title: Strings.of(context)!.signIn,
                status: state.status.toButtonStatus,
                onPressed: onSignInWithEmailAndPasswordPressed,
              );
      },
    );
  }
}
