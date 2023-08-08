// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(bool? hide) hidePasswordChanged,
    required TResult Function(bool autoValidate) autoValidateChanged,
    required TResult Function() signInWithEmailAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(bool? hide)? hidePasswordChanged,
    TResult? Function(bool autoValidate)? autoValidateChanged,
    TResult? Function()? signInWithEmailAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(bool? hide)? hidePasswordChanged,
    TResult Function(bool autoValidate)? autoValidateChanged,
    TResult Function()? signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) usernameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(HidePasswordChanged value) hidePasswordChanged,
    required TResult Function(AutoValidateChanged value) autoValidateChanged,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNameChanged value)? usernameChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult? Function(AutoValidateChanged value)? autoValidateChanged,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? usernameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult Function(AutoValidateChanged value)? autoValidateChanged,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res, SignInFormEvent>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res, $Val extends SignInFormEvent>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserNameChangedCopyWith<$Res> {
  factory _$$UserNameChangedCopyWith(
          _$UserNameChanged value, $Res Function(_$UserNameChanged) then) =
      __$$UserNameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$UserNameChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$UserNameChanged>
    implements _$$UserNameChangedCopyWith<$Res> {
  __$$UserNameChangedCopyWithImpl(
      _$UserNameChanged _value, $Res Function(_$UserNameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$UserNameChanged(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserNameChanged implements UserNameChanged {
  const _$UserNameChanged(this.username);

  @override
  final String username;

  @override
  String toString() {
    return 'SignInFormEvent.usernameChanged(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNameChanged &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNameChangedCopyWith<_$UserNameChanged> get copyWith =>
      __$$UserNameChangedCopyWithImpl<_$UserNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(bool? hide) hidePasswordChanged,
    required TResult Function(bool autoValidate) autoValidateChanged,
    required TResult Function() signInWithEmailAndPasswordPressed,
  }) {
    return usernameChanged(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(bool? hide)? hidePasswordChanged,
    TResult? Function(bool autoValidate)? autoValidateChanged,
    TResult? Function()? signInWithEmailAndPasswordPressed,
  }) {
    return usernameChanged?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(bool? hide)? hidePasswordChanged,
    TResult Function(bool autoValidate)? autoValidateChanged,
    TResult Function()? signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) usernameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(HidePasswordChanged value) hidePasswordChanged,
    required TResult Function(AutoValidateChanged value) autoValidateChanged,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
  }) {
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNameChanged value)? usernameChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult? Function(AutoValidateChanged value)? autoValidateChanged,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
  }) {
    return usernameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? usernameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult Function(AutoValidateChanged value)? autoValidateChanged,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class UserNameChanged implements SignInFormEvent {
  const factory UserNameChanged(final String username) = _$UserNameChanged;

  String get username;
  @JsonKey(ignore: true)
  _$$UserNameChangedCopyWith<_$UserNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedCopyWith<$Res> {
  factory _$$PasswordChangedCopyWith(
          _$PasswordChanged value, $Res Function(_$PasswordChanged) then) =
      __$$PasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$PasswordChanged>
    implements _$$PasswordChangedCopyWith<$Res> {
  __$$PasswordChangedCopyWithImpl(
      _$PasswordChanged _value, $Res Function(_$PasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordChanged(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInFormEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedCopyWith<_$PasswordChanged> get copyWith =>
      __$$PasswordChangedCopyWithImpl<_$PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(bool? hide) hidePasswordChanged,
    required TResult Function(bool autoValidate) autoValidateChanged,
    required TResult Function() signInWithEmailAndPasswordPressed,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(bool? hide)? hidePasswordChanged,
    TResult? Function(bool autoValidate)? autoValidateChanged,
    TResult? Function()? signInWithEmailAndPasswordPressed,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(bool? hide)? hidePasswordChanged,
    TResult Function(bool autoValidate)? autoValidateChanged,
    TResult Function()? signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) usernameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(HidePasswordChanged value) hidePasswordChanged,
    required TResult Function(AutoValidateChanged value) autoValidateChanged,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNameChanged value)? usernameChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult? Function(AutoValidateChanged value)? autoValidateChanged,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? usernameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult Function(AutoValidateChanged value)? autoValidateChanged,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInFormEvent {
  const factory PasswordChanged(final String password) = _$PasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$PasswordChangedCopyWith<_$PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HidePasswordChangedCopyWith<$Res> {
  factory _$$HidePasswordChangedCopyWith(_$HidePasswordChanged value,
          $Res Function(_$HidePasswordChanged) then) =
      __$$HidePasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? hide});
}

/// @nodoc
class __$$HidePasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$HidePasswordChanged>
    implements _$$HidePasswordChangedCopyWith<$Res> {
  __$$HidePasswordChangedCopyWithImpl(
      _$HidePasswordChanged _value, $Res Function(_$HidePasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hide = freezed,
  }) {
    return _then(_$HidePasswordChanged(
      hide: freezed == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$HidePasswordChanged implements HidePasswordChanged {
  const _$HidePasswordChanged({this.hide});

  @override
  final bool? hide;

  @override
  String toString() {
    return 'SignInFormEvent.hidePasswordChanged(hide: $hide)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HidePasswordChanged &&
            (identical(other.hide, hide) || other.hide == hide));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hide);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HidePasswordChangedCopyWith<_$HidePasswordChanged> get copyWith =>
      __$$HidePasswordChangedCopyWithImpl<_$HidePasswordChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(bool? hide) hidePasswordChanged,
    required TResult Function(bool autoValidate) autoValidateChanged,
    required TResult Function() signInWithEmailAndPasswordPressed,
  }) {
    return hidePasswordChanged(hide);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(bool? hide)? hidePasswordChanged,
    TResult? Function(bool autoValidate)? autoValidateChanged,
    TResult? Function()? signInWithEmailAndPasswordPressed,
  }) {
    return hidePasswordChanged?.call(hide);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(bool? hide)? hidePasswordChanged,
    TResult Function(bool autoValidate)? autoValidateChanged,
    TResult Function()? signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (hidePasswordChanged != null) {
      return hidePasswordChanged(hide);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) usernameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(HidePasswordChanged value) hidePasswordChanged,
    required TResult Function(AutoValidateChanged value) autoValidateChanged,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
  }) {
    return hidePasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNameChanged value)? usernameChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult? Function(AutoValidateChanged value)? autoValidateChanged,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
  }) {
    return hidePasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? usernameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult Function(AutoValidateChanged value)? autoValidateChanged,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (hidePasswordChanged != null) {
      return hidePasswordChanged(this);
    }
    return orElse();
  }
}

abstract class HidePasswordChanged implements SignInFormEvent {
  const factory HidePasswordChanged({final bool? hide}) = _$HidePasswordChanged;

  bool? get hide;
  @JsonKey(ignore: true)
  _$$HidePasswordChangedCopyWith<_$HidePasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoValidateChangedCopyWith<$Res> {
  factory _$$AutoValidateChangedCopyWith(_$AutoValidateChanged value,
          $Res Function(_$AutoValidateChanged) then) =
      __$$AutoValidateChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool autoValidate});
}

/// @nodoc
class __$$AutoValidateChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$AutoValidateChanged>
    implements _$$AutoValidateChangedCopyWith<$Res> {
  __$$AutoValidateChangedCopyWithImpl(
      _$AutoValidateChanged _value, $Res Function(_$AutoValidateChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoValidate = null,
  }) {
    return _then(_$AutoValidateChanged(
      null == autoValidate
          ? _value.autoValidate
          : autoValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AutoValidateChanged implements AutoValidateChanged {
  const _$AutoValidateChanged(this.autoValidate);

  @override
  final bool autoValidate;

  @override
  String toString() {
    return 'SignInFormEvent.autoValidateChanged(autoValidate: $autoValidate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoValidateChanged &&
            (identical(other.autoValidate, autoValidate) ||
                other.autoValidate == autoValidate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, autoValidate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoValidateChangedCopyWith<_$AutoValidateChanged> get copyWith =>
      __$$AutoValidateChangedCopyWithImpl<_$AutoValidateChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(bool? hide) hidePasswordChanged,
    required TResult Function(bool autoValidate) autoValidateChanged,
    required TResult Function() signInWithEmailAndPasswordPressed,
  }) {
    return autoValidateChanged(autoValidate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(bool? hide)? hidePasswordChanged,
    TResult? Function(bool autoValidate)? autoValidateChanged,
    TResult? Function()? signInWithEmailAndPasswordPressed,
  }) {
    return autoValidateChanged?.call(autoValidate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(bool? hide)? hidePasswordChanged,
    TResult Function(bool autoValidate)? autoValidateChanged,
    TResult Function()? signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (autoValidateChanged != null) {
      return autoValidateChanged(autoValidate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) usernameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(HidePasswordChanged value) hidePasswordChanged,
    required TResult Function(AutoValidateChanged value) autoValidateChanged,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
  }) {
    return autoValidateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNameChanged value)? usernameChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult? Function(AutoValidateChanged value)? autoValidateChanged,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
  }) {
    return autoValidateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? usernameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult Function(AutoValidateChanged value)? autoValidateChanged,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (autoValidateChanged != null) {
      return autoValidateChanged(this);
    }
    return orElse();
  }
}

abstract class AutoValidateChanged implements SignInFormEvent {
  const factory AutoValidateChanged(final bool autoValidate) =
      _$AutoValidateChanged;

  bool get autoValidate;
  @JsonKey(ignore: true)
  _$$AutoValidateChangedCopyWith<_$AutoValidateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInWithEmailAndPasswordPressedCopyWith<$Res> {
  factory _$$SignInWithEmailAndPasswordPressedCopyWith(
          _$SignInWithEmailAndPasswordPressed value,
          $Res Function(_$SignInWithEmailAndPasswordPressed) then) =
      __$$SignInWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res,
        _$SignInWithEmailAndPasswordPressed>
    implements _$$SignInWithEmailAndPasswordPressedCopyWith<$Res> {
  __$$SignInWithEmailAndPasswordPressedCopyWithImpl(
      _$SignInWithEmailAndPasswordPressed _value,
      $Res Function(_$SignInWithEmailAndPasswordPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInWithEmailAndPasswordPressed
    implements SignInWithEmailAndPasswordPressed {
  const _$SignInWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) usernameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(bool? hide) hidePasswordChanged,
    required TResult Function(bool autoValidate) autoValidateChanged,
    required TResult Function() signInWithEmailAndPasswordPressed,
  }) {
    return signInWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? usernameChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(bool? hide)? hidePasswordChanged,
    TResult? Function(bool autoValidate)? autoValidateChanged,
    TResult? Function()? signInWithEmailAndPasswordPressed,
  }) {
    return signInWithEmailAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? usernameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(bool? hide)? hidePasswordChanged,
    TResult Function(bool autoValidate)? autoValidateChanged,
    TResult Function()? signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) usernameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(HidePasswordChanged value) hidePasswordChanged,
    required TResult Function(AutoValidateChanged value) autoValidateChanged,
    required TResult Function(SignInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
  }) {
    return signInWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNameChanged value)? usernameChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult? Function(AutoValidateChanged value)? autoValidateChanged,
    TResult? Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
  }) {
    return signInWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? usernameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(HidePasswordChanged value)? hidePasswordChanged,
    TResult Function(AutoValidateChanged value)? autoValidateChanged,
    TResult Function(SignInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithEmailAndPasswordPressed implements SignInFormEvent {
  const factory SignInWithEmailAndPasswordPressed() =
      _$SignInWithEmailAndPasswordPressed;
}

/// @nodoc
mixin _$SignInFormState {
  SignInFormz get form => throw _privateConstructorUsedError;
  FormStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool get hidePassword => throw _privateConstructorUsedError;
  bool get autoValidate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res, SignInFormState>;
  @useResult
  $Res call(
      {SignInFormz form,
      FormStatus status,
      Failure? failure,
      bool hidePassword,
      bool autoValidate});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res, $Val extends SignInFormState>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? status = null,
    Object? failure = freezed,
    Object? hidePassword = null,
    Object? autoValidate = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as SignInFormz,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      hidePassword: null == hidePassword
          ? _value.hidePassword
          : hidePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      autoValidate: null == autoValidate
          ? _value.autoValidate
          : autoValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$$_SignInFormStateCopyWith(
          _$_SignInFormState value, $Res Function(_$_SignInFormState) then) =
      __$$_SignInFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SignInFormz form,
      FormStatus status,
      Failure? failure,
      bool hidePassword,
      bool autoValidate});
}

/// @nodoc
class __$$_SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res, _$_SignInFormState>
    implements _$$_SignInFormStateCopyWith<$Res> {
  __$$_SignInFormStateCopyWithImpl(
      _$_SignInFormState _value, $Res Function(_$_SignInFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? status = null,
    Object? failure = freezed,
    Object? hidePassword = null,
    Object? autoValidate = null,
  }) {
    return _then(_$_SignInFormState(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as SignInFormz,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      hidePassword: null == hidePassword
          ? _value.hidePassword
          : hidePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      autoValidate: null == autoValidate
          ? _value.autoValidate
          : autoValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInFormState extends _SignInFormState {
  const _$_SignInFormState(
      {required this.form,
      required this.status,
      this.failure,
      required this.hidePassword,
      required this.autoValidate})
      : super._();

  @override
  final SignInFormz form;
  @override
  final FormStatus status;
  @override
  final Failure? failure;
  @override
  final bool hidePassword;
  @override
  final bool autoValidate;

  @override
  String toString() {
    return 'SignInFormState(form: $form, status: $status, failure: $failure, hidePassword: $hidePassword, autoValidate: $autoValidate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInFormState &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.hidePassword, hidePassword) ||
                other.hidePassword == hidePassword) &&
            (identical(other.autoValidate, autoValidate) ||
                other.autoValidate == autoValidate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, form, status, failure, hidePassword, autoValidate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      __$$_SignInFormStateCopyWithImpl<_$_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState extends SignInFormState {
  const factory _SignInFormState(
      {required final SignInFormz form,
      required final FormStatus status,
      final Failure? failure,
      required final bool hidePassword,
      required final bool autoValidate}) = _$_SignInFormState;
  const _SignInFormState._() : super._();

  @override
  SignInFormz get form;
  @override
  FormStatus get status;
  @override
  Failure? get failure;
  @override
  bool get hidePassword;
  @override
  bool get autoValidate;
  @override
  @JsonKey(ignore: true)
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
