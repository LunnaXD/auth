// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainMenuState {
  MainMenu get menu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainMenuStateCopyWith<MainMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMenuStateCopyWith<$Res> {
  factory $MainMenuStateCopyWith(
          MainMenuState value, $Res Function(MainMenuState) then) =
      _$MainMenuStateCopyWithImpl<$Res, MainMenuState>;
  @useResult
  $Res call({MainMenu menu});
}

/// @nodoc
class _$MainMenuStateCopyWithImpl<$Res, $Val extends MainMenuState>
    implements $MainMenuStateCopyWith<$Res> {
  _$MainMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MainMenu,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainMenuStateCopyWith<$Res>
    implements $MainMenuStateCopyWith<$Res> {
  factory _$$_MainMenuStateCopyWith(
          _$_MainMenuState value, $Res Function(_$_MainMenuState) then) =
      __$$_MainMenuStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MainMenu menu});
}

/// @nodoc
class __$$_MainMenuStateCopyWithImpl<$Res>
    extends _$MainMenuStateCopyWithImpl<$Res, _$_MainMenuState>
    implements _$$_MainMenuStateCopyWith<$Res> {
  __$$_MainMenuStateCopyWithImpl(
      _$_MainMenuState _value, $Res Function(_$_MainMenuState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
  }) {
    return _then(_$_MainMenuState(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MainMenu,
    ));
  }
}

/// @nodoc

class _$_MainMenuState implements _MainMenuState {
  const _$_MainMenuState({required this.menu});

  @override
  final MainMenu menu;

  @override
  String toString() {
    return 'MainMenuState(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainMenuState &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainMenuStateCopyWith<_$_MainMenuState> get copyWith =>
      __$$_MainMenuStateCopyWithImpl<_$_MainMenuState>(this, _$identity);
}

abstract class _MainMenuState implements MainMenuState {
  const factory _MainMenuState({required final MainMenu menu}) =
      _$_MainMenuState;

  @override
  MainMenu get menu;
  @override
  @JsonKey(ignore: true)
  _$$_MainMenuStateCopyWith<_$_MainMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}
