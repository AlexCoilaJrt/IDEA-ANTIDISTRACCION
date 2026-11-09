// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allowlist_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllowlistState {

 List<InstalledApp> get apps; Set<String> get allowed; String get query;
/// Create a copy of AllowlistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllowlistStateCopyWith<AllowlistState> get copyWith => _$AllowlistStateCopyWithImpl<AllowlistState>(this as AllowlistState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AllowlistState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllowlistState&&const DeepCollectionEquality().equals(other.apps, _this.apps)&&const DeepCollectionEquality().equals(other.allowed, _this.allowed)&&(identical(other.query, _this.query) || other.query == _this.query));
}


@override
int get hashCode {
  final _this = this as AllowlistState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.apps),const DeepCollectionEquality().hash(_this.allowed),_this.query);
}

@override
String toString() {
  final _this = this as AllowlistState;
  return 'AllowlistState(apps: ${_this.apps}, allowed: ${_this.allowed}, query: ${_this.query})';
}


}

/// @nodoc
abstract mixin class $AllowlistStateCopyWith<$Res>  {
  factory $AllowlistStateCopyWith(AllowlistState value, $Res Function(AllowlistState) _then) = _$AllowlistStateCopyWithImpl;
@useResult
$Res call({
 List<InstalledApp> apps, Set<String> allowed, String query
});




}
/// @nodoc
class _$AllowlistStateCopyWithImpl<$Res>
    implements $AllowlistStateCopyWith<$Res> {
  _$AllowlistStateCopyWithImpl(this._self, this._then);

  final AllowlistState _self;
  final $Res Function(AllowlistState) _then;

/// Create a copy of AllowlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apps = null,Object? allowed = null,Object? query = null,}) {
  return _then(AllowlistState(
apps: null == apps ? _self.apps : apps // ignore: cast_nullable_to_non_nullable
as List<InstalledApp>,allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as Set<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AllowlistState].
extension AllowlistStatePatterns on AllowlistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllowlistState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllowlistState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllowlistState value)  $default,){
final _that = this;
switch (_that) {
case _AllowlistState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllowlistState value)?  $default,){
final _that = this;
switch (_that) {
case _AllowlistState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InstalledApp> apps,  Set<String> allowed,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllowlistState() when $default != null:
return $default(_that.apps,_that.allowed,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InstalledApp> apps,  Set<String> allowed,  String query)  $default,) {final _that = this;
switch (_that) {
case _AllowlistState():
return $default(_that.apps,_that.allowed,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InstalledApp> apps,  Set<String> allowed,  String query)?  $default,) {final _that = this;
switch (_that) {
case _AllowlistState() when $default != null:
return $default(_that.apps,_that.allowed,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _AllowlistState extends AllowlistState {
  const _AllowlistState({required  List<InstalledApp> apps, required  Set<String> allowed, this.query = ''}): _apps = apps,_allowed = allowed,super._();
  

 final  List<InstalledApp> _apps;
@override List<InstalledApp> get apps {
  if (_apps is EqualUnmodifiableListView) return _apps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_apps);
}

 final  Set<String> _allowed;
@override Set<String> get allowed {
  if (_allowed is EqualUnmodifiableSetView) return _allowed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_allowed);
}

@override@JsonKey() final  String query;

/// Create a copy of AllowlistState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllowlistStateCopyWith<_AllowlistState> get copyWith => __$AllowlistStateCopyWithImpl<_AllowlistState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllowlistState&&const DeepCollectionEquality().equals(other.apps, _apps)&&const DeepCollectionEquality().equals(other.allowed, _allowed)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_apps),const DeepCollectionEquality().hash(_allowed),query);
}

@override
String toString() {
    return 'AllowlistState(apps: $apps, allowed: $allowed, query: $query)';
}


}

/// @nodoc
abstract mixin class _$AllowlistStateCopyWith<$Res> implements $AllowlistStateCopyWith<$Res> {
  factory _$AllowlistStateCopyWith(_AllowlistState value, $Res Function(_AllowlistState) _then) = __$AllowlistStateCopyWithImpl;
@override @useResult
$Res call({
 List<InstalledApp> apps, Set<String> allowed, String query
});




}
/// @nodoc
class __$AllowlistStateCopyWithImpl<$Res>
    implements _$AllowlistStateCopyWith<$Res> {
  __$AllowlistStateCopyWithImpl(this._self, this._then);

  final _AllowlistState _self;
  final $Res Function(_AllowlistState) _then;

/// Create a copy of AllowlistState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apps = null,Object? allowed = null,Object? query = null,}) {
  return _then(_AllowlistState(
apps: null == apps ? _self._apps : apps // ignore: cast_nullable_to_non_nullable
as List<InstalledApp>,allowed: null == allowed ? _self._allowed : allowed // ignore: cast_nullable_to_non_nullable
as Set<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
