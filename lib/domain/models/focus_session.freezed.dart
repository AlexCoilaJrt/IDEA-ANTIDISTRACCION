// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FocusSession {

 int get id; DateTime get startedAt; PomodoroPlan get plan; SessionOutcome get outcome; DateTime? get endedAt; int get focusedMinutes; int get exitLevel; int get distractionCount; String? get exitReason; int? get subjectId; String? get roomId;
/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FocusSessionCopyWith<FocusSession> get copyWith => _$FocusSessionCopyWithImpl<FocusSession>(this as FocusSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FocusSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FocusSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.plan, _this.plan) || other.plan == _this.plan)&&(identical(other.outcome, _this.outcome) || other.outcome == _this.outcome)&&(identical(other.endedAt, _this.endedAt) || other.endedAt == _this.endedAt)&&(identical(other.focusedMinutes, _this.focusedMinutes) || other.focusedMinutes == _this.focusedMinutes)&&(identical(other.exitLevel, _this.exitLevel) || other.exitLevel == _this.exitLevel)&&(identical(other.distractionCount, _this.distractionCount) || other.distractionCount == _this.distractionCount)&&(identical(other.exitReason, _this.exitReason) || other.exitReason == _this.exitReason)&&(identical(other.subjectId, _this.subjectId) || other.subjectId == _this.subjectId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId));
}


@override
int get hashCode {
  final _this = this as FocusSession;
  return Object.hash(runtimeType,_this.id,_this.startedAt,_this.plan,_this.outcome,_this.endedAt,_this.focusedMinutes,_this.exitLevel,_this.distractionCount,_this.exitReason,_this.subjectId,_this.roomId);
}

@override
String toString() {
  final _this = this as FocusSession;
  return 'FocusSession(id: ${_this.id}, startedAt: ${_this.startedAt}, plan: ${_this.plan}, outcome: ${_this.outcome}, endedAt: ${_this.endedAt}, focusedMinutes: ${_this.focusedMinutes}, exitLevel: ${_this.exitLevel}, distractionCount: ${_this.distractionCount}, exitReason: ${_this.exitReason}, subjectId: ${_this.subjectId}, roomId: ${_this.roomId})';
}


}

/// @nodoc
abstract mixin class $FocusSessionCopyWith<$Res>  {
  factory $FocusSessionCopyWith(FocusSession value, $Res Function(FocusSession) _then) = _$FocusSessionCopyWithImpl;
@useResult
$Res call({
 int id, DateTime startedAt, PomodoroPlan plan, SessionOutcome outcome, DateTime? endedAt, int focusedMinutes, int exitLevel, int distractionCount, String? exitReason, int? subjectId, String? roomId
});


$PomodoroPlanCopyWith<$Res> get plan;

}
/// @nodoc
class _$FocusSessionCopyWithImpl<$Res>
    implements $FocusSessionCopyWith<$Res> {
  _$FocusSessionCopyWithImpl(this._self, this._then);

  final FocusSession _self;
  final $Res Function(FocusSession) _then;

/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? plan = null,Object? outcome = null,Object? endedAt = freezed,Object? focusedMinutes = null,Object? exitLevel = null,Object? distractionCount = null,Object? exitReason = freezed,Object? subjectId = freezed,Object? roomId = freezed,}) {
  return _then(FocusSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PomodoroPlan,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as SessionOutcome,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,focusedMinutes: null == focusedMinutes ? _self.focusedMinutes : focusedMinutes // ignore: cast_nullable_to_non_nullable
as int,exitLevel: null == exitLevel ? _self.exitLevel : exitLevel // ignore: cast_nullable_to_non_nullable
as int,distractionCount: null == distractionCount ? _self.distractionCount : distractionCount // ignore: cast_nullable_to_non_nullable
as int,exitReason: freezed == exitReason ? _self.exitReason : exitReason // ignore: cast_nullable_to_non_nullable
as String?,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PomodoroPlanCopyWith<$Res> get plan {
  
  return $PomodoroPlanCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [FocusSession].
extension FocusSessionPatterns on FocusSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FocusSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FocusSession value)  $default,){
final _that = this;
switch (_that) {
case _FocusSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FocusSession value)?  $default,){
final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime startedAt,  PomodoroPlan plan,  SessionOutcome outcome,  DateTime? endedAt,  int focusedMinutes,  int exitLevel,  int distractionCount,  String? exitReason,  int? subjectId,  String? roomId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.plan,_that.outcome,_that.endedAt,_that.focusedMinutes,_that.exitLevel,_that.distractionCount,_that.exitReason,_that.subjectId,_that.roomId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime startedAt,  PomodoroPlan plan,  SessionOutcome outcome,  DateTime? endedAt,  int focusedMinutes,  int exitLevel,  int distractionCount,  String? exitReason,  int? subjectId,  String? roomId)  $default,) {final _that = this;
switch (_that) {
case _FocusSession():
return $default(_that.id,_that.startedAt,_that.plan,_that.outcome,_that.endedAt,_that.focusedMinutes,_that.exitLevel,_that.distractionCount,_that.exitReason,_that.subjectId,_that.roomId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime startedAt,  PomodoroPlan plan,  SessionOutcome outcome,  DateTime? endedAt,  int focusedMinutes,  int exitLevel,  int distractionCount,  String? exitReason,  int? subjectId,  String? roomId)?  $default,) {final _that = this;
switch (_that) {
case _FocusSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.plan,_that.outcome,_that.endedAt,_that.focusedMinutes,_that.exitLevel,_that.distractionCount,_that.exitReason,_that.subjectId,_that.roomId);case _:
  return null;

}
}

}

/// @nodoc


class _FocusSession extends FocusSession {
  const _FocusSession({required this.id, required this.startedAt, required this.plan, required this.outcome, this.endedAt, this.focusedMinutes = 0, this.exitLevel = 0, this.distractionCount = 0, this.exitReason, this.subjectId, this.roomId}): super._();
  

@override final  int id;
@override final  DateTime startedAt;
@override final  PomodoroPlan plan;
@override final  SessionOutcome outcome;
@override final  DateTime? endedAt;
@override@JsonKey() final  int focusedMinutes;
@override@JsonKey() final  int exitLevel;
@override@JsonKey() final  int distractionCount;
@override final  String? exitReason;
@override final  int? subjectId;
@override final  String? roomId;

/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FocusSessionCopyWith<_FocusSession> get copyWith => __$FocusSessionCopyWithImpl<_FocusSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FocusSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.focusedMinutes, focusedMinutes) || other.focusedMinutes == focusedMinutes)&&(identical(other.exitLevel, exitLevel) || other.exitLevel == exitLevel)&&(identical(other.distractionCount, distractionCount) || other.distractionCount == distractionCount)&&(identical(other.exitReason, exitReason) || other.exitReason == exitReason)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startedAt,plan,outcome,endedAt,focusedMinutes,exitLevel,distractionCount,exitReason,subjectId,roomId);
}

@override
String toString() {
    return 'FocusSession(id: $id, startedAt: $startedAt, plan: $plan, outcome: $outcome, endedAt: $endedAt, focusedMinutes: $focusedMinutes, exitLevel: $exitLevel, distractionCount: $distractionCount, exitReason: $exitReason, subjectId: $subjectId, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$FocusSessionCopyWith<$Res> implements $FocusSessionCopyWith<$Res> {
  factory _$FocusSessionCopyWith(_FocusSession value, $Res Function(_FocusSession) _then) = __$FocusSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime startedAt, PomodoroPlan plan, SessionOutcome outcome, DateTime? endedAt, int focusedMinutes, int exitLevel, int distractionCount, String? exitReason, int? subjectId, String? roomId
});


@override $PomodoroPlanCopyWith<$Res> get plan;

}
/// @nodoc
class __$FocusSessionCopyWithImpl<$Res>
    implements _$FocusSessionCopyWith<$Res> {
  __$FocusSessionCopyWithImpl(this._self, this._then);

  final _FocusSession _self;
  final $Res Function(_FocusSession) _then;

/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? plan = null,Object? outcome = null,Object? endedAt = freezed,Object? focusedMinutes = null,Object? exitLevel = null,Object? distractionCount = null,Object? exitReason = freezed,Object? subjectId = freezed,Object? roomId = freezed,}) {
  return _then(_FocusSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PomodoroPlan,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as SessionOutcome,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,focusedMinutes: null == focusedMinutes ? _self.focusedMinutes : focusedMinutes // ignore: cast_nullable_to_non_nullable
as int,exitLevel: null == exitLevel ? _self.exitLevel : exitLevel // ignore: cast_nullable_to_non_nullable
as int,distractionCount: null == distractionCount ? _self.distractionCount : distractionCount // ignore: cast_nullable_to_non_nullable
as int,exitReason: freezed == exitReason ? _self.exitReason : exitReason // ignore: cast_nullable_to_non_nullable
as String?,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FocusSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PomodoroPlanCopyWith<$Res> get plan {
  
  return $PomodoroPlanCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}

// dart format on
