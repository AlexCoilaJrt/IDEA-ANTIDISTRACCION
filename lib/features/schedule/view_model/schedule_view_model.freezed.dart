// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleState {

 List<StudyBlock> get blocks; DateTime get now; ScheduledOccurrence? get next; bool get exactAlarms;
/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleStateCopyWith<ScheduleState> get copyWith => _$ScheduleStateCopyWithImpl<ScheduleState>(this as ScheduleState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScheduleState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleState&&const DeepCollectionEquality().equals(other.blocks, _this.blocks)&&(identical(other.now, _this.now) || other.now == _this.now)&&(identical(other.next, _this.next) || other.next == _this.next)&&(identical(other.exactAlarms, _this.exactAlarms) || other.exactAlarms == _this.exactAlarms));
}


@override
int get hashCode {
  final _this = this as ScheduleState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.blocks),_this.now,_this.next,_this.exactAlarms);
}

@override
String toString() {
  final _this = this as ScheduleState;
  return 'ScheduleState(blocks: ${_this.blocks}, now: ${_this.now}, next: ${_this.next}, exactAlarms: ${_this.exactAlarms})';
}


}

/// @nodoc
abstract mixin class $ScheduleStateCopyWith<$Res>  {
  factory $ScheduleStateCopyWith(ScheduleState value, $Res Function(ScheduleState) _then) = _$ScheduleStateCopyWithImpl;
@useResult
$Res call({
 List<StudyBlock> blocks, DateTime now, ScheduledOccurrence? next, bool exactAlarms
});


$ScheduledOccurrenceCopyWith<$Res>? get next;

}
/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._self, this._then);

  final ScheduleState _self;
  final $Res Function(ScheduleState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blocks = null,Object? now = null,Object? next = freezed,Object? exactAlarms = null,}) {
  return _then(ScheduleState(
blocks: null == blocks ? _self.blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<StudyBlock>,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as ScheduledOccurrence?,exactAlarms: null == exactAlarms ? _self.exactAlarms : exactAlarms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduledOccurrenceCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $ScheduledOccurrenceCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScheduleState].
extension ScheduleStatePatterns on ScheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StudyBlock> blocks,  DateTime now,  ScheduledOccurrence? next,  bool exactAlarms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
return $default(_that.blocks,_that.now,_that.next,_that.exactAlarms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StudyBlock> blocks,  DateTime now,  ScheduledOccurrence? next,  bool exactAlarms)  $default,) {final _that = this;
switch (_that) {
case _ScheduleState():
return $default(_that.blocks,_that.now,_that.next,_that.exactAlarms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StudyBlock> blocks,  DateTime now,  ScheduledOccurrence? next,  bool exactAlarms)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
return $default(_that.blocks,_that.now,_that.next,_that.exactAlarms);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleState extends ScheduleState {
  const _ScheduleState({required  List<StudyBlock> blocks, required this.now, this.next, this.exactAlarms = true}): _blocks = blocks,super._();
  

 final  List<StudyBlock> _blocks;
@override List<StudyBlock> get blocks {
  if (_blocks is EqualUnmodifiableListView) return _blocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blocks);
}

@override final  DateTime now;
@override final  ScheduledOccurrence? next;
@override@JsonKey() final  bool exactAlarms;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleStateCopyWith<_ScheduleState> get copyWith => __$ScheduleStateCopyWithImpl<_ScheduleState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleState&&const DeepCollectionEquality().equals(other.blocks, _blocks)&&(identical(other.now, now) || other.now == now)&&(identical(other.next, next) || other.next == next)&&(identical(other.exactAlarms, exactAlarms) || other.exactAlarms == exactAlarms));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_blocks),now,next,exactAlarms);
}

@override
String toString() {
    return 'ScheduleState(blocks: $blocks, now: $now, next: $next, exactAlarms: $exactAlarms)';
}


}

/// @nodoc
abstract mixin class _$ScheduleStateCopyWith<$Res> implements $ScheduleStateCopyWith<$Res> {
  factory _$ScheduleStateCopyWith(_ScheduleState value, $Res Function(_ScheduleState) _then) = __$ScheduleStateCopyWithImpl;
@override @useResult
$Res call({
 List<StudyBlock> blocks, DateTime now, ScheduledOccurrence? next, bool exactAlarms
});


@override $ScheduledOccurrenceCopyWith<$Res>? get next;

}
/// @nodoc
class __$ScheduleStateCopyWithImpl<$Res>
    implements _$ScheduleStateCopyWith<$Res> {
  __$ScheduleStateCopyWithImpl(this._self, this._then);

  final _ScheduleState _self;
  final $Res Function(_ScheduleState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blocks = null,Object? now = null,Object? next = freezed,Object? exactAlarms = null,}) {
  return _then(_ScheduleState(
blocks: null == blocks ? _self._blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<StudyBlock>,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as ScheduledOccurrence?,exactAlarms: null == exactAlarms ? _self.exactAlarms : exactAlarms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduledOccurrenceCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $ScheduledOccurrenceCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}

// dart format on
