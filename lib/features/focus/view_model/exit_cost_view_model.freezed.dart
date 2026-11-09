// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exit_cost_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExitCostState {

 int get secondsLeft; int get step; String get reason; bool get busy; bool get exited;
/// Create a copy of ExitCostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExitCostStateCopyWith<ExitCostState> get copyWith => _$ExitCostStateCopyWithImpl<ExitCostState>(this as ExitCostState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ExitCostState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExitCostState&&(identical(other.secondsLeft, _this.secondsLeft) || other.secondsLeft == _this.secondsLeft)&&(identical(other.step, _this.step) || other.step == _this.step)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.exited, _this.exited) || other.exited == _this.exited));
}


@override
int get hashCode {
  final _this = this as ExitCostState;
  return Object.hash(runtimeType,_this.secondsLeft,_this.step,_this.reason,_this.busy,_this.exited);
}

@override
String toString() {
  final _this = this as ExitCostState;
  return 'ExitCostState(secondsLeft: ${_this.secondsLeft}, step: ${_this.step}, reason: ${_this.reason}, busy: ${_this.busy}, exited: ${_this.exited})';
}


}

/// @nodoc
abstract mixin class $ExitCostStateCopyWith<$Res>  {
  factory $ExitCostStateCopyWith(ExitCostState value, $Res Function(ExitCostState) _then) = _$ExitCostStateCopyWithImpl;
@useResult
$Res call({
 int secondsLeft, int step, String reason, bool busy, bool exited
});




}
/// @nodoc
class _$ExitCostStateCopyWithImpl<$Res>
    implements $ExitCostStateCopyWith<$Res> {
  _$ExitCostStateCopyWithImpl(this._self, this._then);

  final ExitCostState _self;
  final $Res Function(ExitCostState) _then;

/// Create a copy of ExitCostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? secondsLeft = null,Object? step = null,Object? reason = null,Object? busy = null,Object? exited = null,}) {
  return _then(ExitCostState(
secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,exited: null == exited ? _self.exited : exited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExitCostState].
extension ExitCostStatePatterns on ExitCostState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExitCostState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExitCostState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExitCostState value)  $default,){
final _that = this;
switch (_that) {
case _ExitCostState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExitCostState value)?  $default,){
final _that = this;
switch (_that) {
case _ExitCostState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int secondsLeft,  int step,  String reason,  bool busy,  bool exited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExitCostState() when $default != null:
return $default(_that.secondsLeft,_that.step,_that.reason,_that.busy,_that.exited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int secondsLeft,  int step,  String reason,  bool busy,  bool exited)  $default,) {final _that = this;
switch (_that) {
case _ExitCostState():
return $default(_that.secondsLeft,_that.step,_that.reason,_that.busy,_that.exited);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int secondsLeft,  int step,  String reason,  bool busy,  bool exited)?  $default,) {final _that = this;
switch (_that) {
case _ExitCostState() when $default != null:
return $default(_that.secondsLeft,_that.step,_that.reason,_that.busy,_that.exited);case _:
  return null;

}
}

}

/// @nodoc


class _ExitCostState extends ExitCostState {
  const _ExitCostState({required this.secondsLeft, this.step = 1, this.reason = '', this.busy = false, this.exited = false}): super._();
  

@override final  int secondsLeft;
@override@JsonKey() final  int step;
@override@JsonKey() final  String reason;
@override@JsonKey() final  bool busy;
@override@JsonKey() final  bool exited;

/// Create a copy of ExitCostState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExitCostStateCopyWith<_ExitCostState> get copyWith => __$ExitCostStateCopyWithImpl<_ExitCostState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExitCostState&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.step, step) || other.step == step)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.exited, exited) || other.exited == exited));
}


@override
int get hashCode {
    return Object.hash(runtimeType,secondsLeft,step,reason,busy,exited);
}

@override
String toString() {
    return 'ExitCostState(secondsLeft: $secondsLeft, step: $step, reason: $reason, busy: $busy, exited: $exited)';
}


}

/// @nodoc
abstract mixin class _$ExitCostStateCopyWith<$Res> implements $ExitCostStateCopyWith<$Res> {
  factory _$ExitCostStateCopyWith(_ExitCostState value, $Res Function(_ExitCostState) _then) = __$ExitCostStateCopyWithImpl;
@override @useResult
$Res call({
 int secondsLeft, int step, String reason, bool busy, bool exited
});




}
/// @nodoc
class __$ExitCostStateCopyWithImpl<$Res>
    implements _$ExitCostStateCopyWith<$Res> {
  __$ExitCostStateCopyWithImpl(this._self, this._then);

  final _ExitCostState _self;
  final $Res Function(_ExitCostState) _then;

/// Create a copy of ExitCostState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? secondsLeft = null,Object? step = null,Object? reason = null,Object? busy = null,Object? exited = null,}) {
  return _then(_ExitCostState(
secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,exited: null == exited ? _self.exited : exited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
