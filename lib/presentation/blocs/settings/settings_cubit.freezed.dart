// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  ThemeModeOptions get activeTheme => throw _privateConstructorUsedError;
  LanguageOptions get activeLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({ThemeModeOptions activeTheme, LanguageOptions activeLanguage});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTheme = null,
    Object? activeLanguage = null,
  }) {
    return _then(_value.copyWith(
      activeTheme: null == activeTheme
          ? _value.activeTheme
          : activeTheme // ignore: cast_nullable_to_non_nullable
              as ThemeModeOptions,
      activeLanguage: null == activeLanguage
          ? _value.activeLanguage
          : activeLanguage // ignore: cast_nullable_to_non_nullable
              as LanguageOptions,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_SettingsStateCopyWith(
          _$_SettingsState value, $Res Function(_$_SettingsState) then) =
      __$$_SettingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeModeOptions activeTheme, LanguageOptions activeLanguage});
}

/// @nodoc
class __$$_SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_SettingsState>
    implements _$$_SettingsStateCopyWith<$Res> {
  __$$_SettingsStateCopyWithImpl(
      _$_SettingsState _value, $Res Function(_$_SettingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTheme = null,
    Object? activeLanguage = null,
  }) {
    return _then(_$_SettingsState(
      activeTheme: null == activeTheme
          ? _value.activeTheme
          : activeTheme // ignore: cast_nullable_to_non_nullable
              as ThemeModeOptions,
      activeLanguage: null == activeLanguage
          ? _value.activeLanguage
          : activeLanguage // ignore: cast_nullable_to_non_nullable
              as LanguageOptions,
    ));
  }
}

/// @nodoc

class _$_SettingsState implements _SettingsState {
  const _$_SettingsState(
      {required this.activeTheme, required this.activeLanguage});

  @override
  final ThemeModeOptions activeTheme;
  @override
  final LanguageOptions activeLanguage;

  @override
  String toString() {
    return 'SettingsState(activeTheme: $activeTheme, activeLanguage: $activeLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsState &&
            (identical(other.activeTheme, activeTheme) ||
                other.activeTheme == activeTheme) &&
            (identical(other.activeLanguage, activeLanguage) ||
                other.activeLanguage == activeLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeTheme, activeLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsStateCopyWith<_$_SettingsState> get copyWith =>
      __$$_SettingsStateCopyWithImpl<_$_SettingsState>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required final ThemeModeOptions activeTheme,
      required final LanguageOptions activeLanguage}) = _$_SettingsState;

  @override
  ThemeModeOptions get activeTheme;
  @override
  LanguageOptions get activeLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsStateCopyWith<_$_SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
