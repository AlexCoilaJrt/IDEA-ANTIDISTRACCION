// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PomodoroPlan {

 int get focusMinutes; int get breakMinutes; int get cycles; int get longBreakMinutes;
/// Create a copy of PomodoroPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PomodoroPlanCopyWith<PomodoroPlan> get copyWith => _$PomodoroPlanCopyWithImpl<PomodoroPlan>(this as PomodoroPlan, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PomodoroPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PomodoroPlan&&(identical(other.focusMinutes, _this.focusMinutes) || other.focusMinutes == _this.focusMinutes)&&(identical(other.breakMinutes, _this.breakMinutes) || other.breakMinutes == _this.breakMinutes)&&(identical(other.cycles, _this.cycles) || other.cycles == _this.cycles)&&(identical(other.longBreakMinutes, _this.longBreakMinutes) || other.longBreakMinutes == _this.longBreakMinutes));
}


@override
int get hashCode {
  final _this = this as PomodoroPlan;
  return Object.hash(runtimeType,_this.focusMinutes,_this.breakMinutes,_this.cycles,_this.longBreakMinutes);
}

@override
String toString() {
  final _this = this as PomodoroPlan;
  return 'PomodoroPlan(focusMinutes: ${_this.focusMinutes}, breakMinutes: ${_this.breakMinutes}, cycles: ${_this.cycles}, longBreakMinutes: ${_this.longBreakMinutes})';
}


}

/// @nodoc
abstract mixin class $PomodoroPlanCopyWith<$Res>  {
  factory $PomodoroPlanCopyWith(PomodoroPlan value, $Res Function(PomodoroPlan) _then) = _$PomodoroPlanCopyWithImpl;
@useResult
$Res call({
 int focusMinutes, int breakMinutes, int cycles, int longBreakMinutes
});




}
/// @nodoc
class _$PomodoroPlanCopyWithImpl<$Res>
    implements $PomodoroPlanCopyWith<$Res> {
  _$PomodoroPlanCopyWithImpl(this._self, this._then);

  final PomodoroPlan _self;
  final $Res Function(PomodoroPlan) _then;

/// Create a copy of PomodoroPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? focusMinutes = null,Object? breakMinutes = null,Object? cycles = null,Object? longBreakMinutes = null,}) {
  return _then(PomodoroPlan(
focusMinutes: null == focusMinutes ? _self.focusMinutes : focusMinutes // ignore: cast_nullable_to_non_nullable
as int,breakMinutes: null == breakMinutes ? _self.breakMinutes : breakMinutes // ignore: cast_nullable_to_non_nullable
as int,cycles: null == cycles ? _self.cycles : cycles // ignore: cast_nullable_to_non_nullable
as int,longBreakMinutes: null == longBreakMinutes ? _self.longBreakMinutes : longBreakMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PomodoroPlan].
extension PomodoroPlanPatterns on PomodoroPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PomodoroPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PomodoroPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PomodoroPlan value)  $default,){
final _that = this;
switch (_that) {
case _PomodoroPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PomodoroPlan value)?  $default,){
final _that = this;
switch (_that) {
case _PomodoroPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int focusMinutes,  int breakMinutes,  int cycles,  int longBreakMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PomodoroPlan() when $default != null:
return $default(_that.focusMinutes,_that.breakMinutes,_that.cycles,_that.longBreakMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int focusMinutes,  int breakMinutes,  int cycles,  int longBreakMinutes)  $default,) {final _that = this;
switch (_that) {
case _PomodoroPlan():
return $default(_that.focusMinutes,_that.breakMinutes,_that.cycles,_that.longBreakMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int focusMinutes,  int breakMinutes,  int cycles,  int longBreakMinutes)?  $default,) {final _that = this;
switch (_that) {
case _PomodoroPlan() when $default != null:
return $default(_that.focusMinutes,_that.breakMinutes,_that.cycles,_that.longBreakMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _PomodoroPlan extends PomodoroPlan {
  const _PomodoroPlan({required this.focusMinutes, required this.breakMinutes, required this.cycles, this.longBreakMinutes = 0}): super._();
  

@override final  int focusMinutes;
@override final  int breakMinutes;
@override final  int cycles;
@override@JsonKey() final  int longBreakMinutes;

/// Create a copy of PomodoroPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PomodoroPlanCopyWith<_PomodoroPlan> get copyWith => __$PomodoroPlanCopyWithImpl<_PomodoroPlan>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PomodoroPlan&&(identical(other.focusMinutes, focusMinutes) || other.focusMinutes == focusMinutes)&&(identical(other.breakMinutes, breakMinutes) || other.breakMinutes == breakMinutes)&&(identical(other.cycles, cycles) || other.cycles == cycles)&&(identical(other.longBreakMinutes, longBreakMinutes) || other.longBreakMinutes == longBreakMinutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,focusMinutes,breakMinutes,cycles,longBreakMinutes);
}

@override
String toString() {
    return 'PomodoroPlan(focusMinutes: $focusMinutes, breakMinutes: $breakMinutes, cycles: $cycles, longBreakMinutes: $longBreakMinutes)';
}


}

/// @nodoc
abstract mixin class _$PomodoroPlanCopyWith<$Res> implements $PomodoroPlanCopyWith<$Res> {
  factory _$PomodoroPlanCopyWith(_PomodoroPlan value, $Res Function(_PomodoroPlan) _then) = __$PomodoroPlanCopyWithImpl;
@override @useResult
$Res call({
 int focusMinutes, int breakMinutes, int cycles, int longBreakMinutes
});




}
/// @nodoc
class __$PomodoroPlanCopyWithImpl<$Res>
    implements _$PomodoroPlanCopyWith<$Res> {
  __$PomodoroPlanCopyWithImpl(this._self, this._then);

  final _PomodoroPlan _self;
  final $Res Function(_PomodoroPlan) _then;

/// Create a copy of PomodoroPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? focusMinutes = null,Object? breakMinutes = null,Object? cycles = null,Object? longBreakMinutes = null,}) {
  return _then(_PomodoroPlan(
focusMinutes: null == focusMinutes ? _self.focusMinutes : focusMinutes // ignore: cast_nullable_to_non_nullable
as int,breakMinutes: null == breakMinutes ? _self.breakMinutes : breakMinutes // ignore: cast_nullable_to_non_nullable
as int,cycles: null == cycles ? _self.cycles : cycles // ignore: cast_nullable_to_non_nullable
as int,longBreakMinutes: null == longBreakMinutes ? _self.longBreakMinutes : longBreakMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
