// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionsUiState {

 AppPermissions get permissions; Set<PermissionKind> get skipped;/// Paso elegido a mano desde el resumen.
 PermissionKind? get selected;
/// Create a copy of PermissionsUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionsUiStateCopyWith<PermissionsUiState> get copyWith => _$PermissionsUiStateCopyWithImpl<PermissionsUiState>(this as PermissionsUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PermissionsUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionsUiState&&(identical(other.permissions, _this.permissions) || other.permissions == _this.permissions)&&const DeepCollectionEquality().equals(other.skipped, _this.skipped)&&(identical(other.selected, _this.selected) || other.selected == _this.selected));
}


@override
int get hashCode {
  final _this = this as PermissionsUiState;
  return Object.hash(runtimeType,_this.permissions,const DeepCollectionEquality().hash(_this.skipped),_this.selected);
}

@override
String toString() {
  final _this = this as PermissionsUiState;
  return 'PermissionsUiState(permissions: ${_this.permissions}, skipped: ${_this.skipped}, selected: ${_this.selected})';
}


}

/// @nodoc
abstract mixin class $PermissionsUiStateCopyWith<$Res>  {
  factory $PermissionsUiStateCopyWith(PermissionsUiState value, $Res Function(PermissionsUiState) _then) = _$PermissionsUiStateCopyWithImpl;
@useResult
$Res call({
 AppPermissions permissions, Set<PermissionKind> skipped, PermissionKind? selected
});


$AppPermissionsCopyWith<$Res> get permissions;

}
/// @nodoc
class _$PermissionsUiStateCopyWithImpl<$Res>
    implements $PermissionsUiStateCopyWith<$Res> {
  _$PermissionsUiStateCopyWithImpl(this._self, this._then);

  final PermissionsUiState _self;
  final $Res Function(PermissionsUiState) _then;

/// Create a copy of PermissionsUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permissions = null,Object? skipped = null,Object? selected = freezed,}) {
  return _then(PermissionsUiState(
permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as AppPermissions,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as Set<PermissionKind>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as PermissionKind?,
  ));
}
/// Create a copy of PermissionsUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppPermissionsCopyWith<$Res> get permissions {
  
  return $AppPermissionsCopyWith<$Res>(_self.permissions, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}


/// Adds pattern-matching-related methods to [PermissionsUiState].
extension PermissionsUiStatePatterns on PermissionsUiState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionsUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionsUiState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionsUiState value)  $default,){
final _that = this;
switch (_that) {
case _PermissionsUiState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionsUiState value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionsUiState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppPermissions permissions,  Set<PermissionKind> skipped,  PermissionKind? selected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionsUiState() when $default != null:
return $default(_that.permissions,_that.skipped,_that.selected);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppPermissions permissions,  Set<PermissionKind> skipped,  PermissionKind? selected)  $default,) {final _that = this;
switch (_that) {
case _PermissionsUiState():
return $default(_that.permissions,_that.skipped,_that.selected);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppPermissions permissions,  Set<PermissionKind> skipped,  PermissionKind? selected)?  $default,) {final _that = this;
switch (_that) {
case _PermissionsUiState() when $default != null:
return $default(_that.permissions,_that.skipped,_that.selected);case _:
  return null;

}
}

}

/// @nodoc


class _PermissionsUiState extends PermissionsUiState {
  const _PermissionsUiState({required this.permissions,  Set<PermissionKind> skipped = const <PermissionKind>{}, this.selected}): _skipped = skipped,super._();
  

@override final  AppPermissions permissions;
 final  Set<PermissionKind> _skipped;
@override@JsonKey() Set<PermissionKind> get skipped {
  if (_skipped is EqualUnmodifiableSetView) return _skipped;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_skipped);
}

/// Paso elegido a mano desde el resumen.
@override final  PermissionKind? selected;

/// Create a copy of PermissionsUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionsUiStateCopyWith<_PermissionsUiState> get copyWith => __$PermissionsUiStateCopyWithImpl<_PermissionsUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionsUiState&&(identical(other.permissions, permissions) || other.permissions == permissions)&&const DeepCollectionEquality().equals(other.skipped, _skipped)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode {
    return Object.hash(runtimeType,permissions,const DeepCollectionEquality().hash(_skipped),selected);
}

@override
String toString() {
    return 'PermissionsUiState(permissions: $permissions, skipped: $skipped, selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$PermissionsUiStateCopyWith<$Res> implements $PermissionsUiStateCopyWith<$Res> {
  factory _$PermissionsUiStateCopyWith(_PermissionsUiState value, $Res Function(_PermissionsUiState) _then) = __$PermissionsUiStateCopyWithImpl;
@override @useResult
$Res call({
 AppPermissions permissions, Set<PermissionKind> skipped, PermissionKind? selected
});


@override $AppPermissionsCopyWith<$Res> get permissions;

}
/// @nodoc
class __$PermissionsUiStateCopyWithImpl<$Res>
    implements _$PermissionsUiStateCopyWith<$Res> {
  __$PermissionsUiStateCopyWithImpl(this._self, this._then);

  final _PermissionsUiState _self;
  final $Res Function(_PermissionsUiState) _then;

/// Create a copy of PermissionsUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permissions = null,Object? skipped = null,Object? selected = freezed,}) {
  return _then(_PermissionsUiState(
permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as AppPermissions,skipped: null == skipped ? _self._skipped : skipped // ignore: cast_nullable_to_non_nullable
as Set<PermissionKind>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as PermissionKind?,
  ));
}

/// Create a copy of PermissionsUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppPermissionsCopyWith<$Res> get permissions {
  
  return $AppPermissionsCopyWith<$Res>(_self.permissions, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}

// dart format on
