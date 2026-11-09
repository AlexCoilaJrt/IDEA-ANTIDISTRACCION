// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsState {

 StreakSummary get streak; int get goalMinutes; int get todayMinutes; int get weekMinutes; int get completedSessions; int get weekDistractions;/// Últimos 7 días, del más antiguo a hoy.
 List<DateTime> get lastWeekDays; List<int> get lastWeekMinutes; Map<DateTime, int> get minutesByDay; List<FocusSession> get recentSessions; DateTime get today;
/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsStateCopyWith<StatsState> get copyWith => _$StatsStateCopyWithImpl<StatsState>(this as StatsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StatsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsState&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.goalMinutes, _this.goalMinutes) || other.goalMinutes == _this.goalMinutes)&&(identical(other.todayMinutes, _this.todayMinutes) || other.todayMinutes == _this.todayMinutes)&&(identical(other.weekMinutes, _this.weekMinutes) || other.weekMinutes == _this.weekMinutes)&&(identical(other.completedSessions, _this.completedSessions) || other.completedSessions == _this.completedSessions)&&(identical(other.weekDistractions, _this.weekDistractions) || other.weekDistractions == _this.weekDistractions)&&const DeepCollectionEquality().equals(other.lastWeekDays, _this.lastWeekDays)&&const DeepCollectionEquality().equals(other.lastWeekMinutes, _this.lastWeekMinutes)&&const DeepCollectionEquality().equals(other.minutesByDay, _this.minutesByDay)&&const DeepCollectionEquality().equals(other.recentSessions, _this.recentSessions)&&(identical(other.today, _this.today) || other.today == _this.today));
}


@override
int get hashCode {
  final _this = this as StatsState;
  return Object.hash(runtimeType,_this.streak,_this.goalMinutes,_this.todayMinutes,_this.weekMinutes,_this.completedSessions,_this.weekDistractions,const DeepCollectionEquality().hash(_this.lastWeekDays),const DeepCollectionEquality().hash(_this.lastWeekMinutes),const DeepCollectionEquality().hash(_this.minutesByDay),const DeepCollectionEquality().hash(_this.recentSessions),_this.today);
}

@override
String toString() {
  final _this = this as StatsState;
  return 'StatsState(streak: ${_this.streak}, goalMinutes: ${_this.goalMinutes}, todayMinutes: ${_this.todayMinutes}, weekMinutes: ${_this.weekMinutes}, completedSessions: ${_this.completedSessions}, weekDistractions: ${_this.weekDistractions}, lastWeekDays: ${_this.lastWeekDays}, lastWeekMinutes: ${_this.lastWeekMinutes}, minutesByDay: ${_this.minutesByDay}, recentSessions: ${_this.recentSessions}, today: ${_this.today})';
}


}

/// @nodoc
abstract mixin class $StatsStateCopyWith<$Res>  {
  factory $StatsStateCopyWith(StatsState value, $Res Function(StatsState) _then) = _$StatsStateCopyWithImpl;
@useResult
$Res call({
 StreakSummary streak, int goalMinutes, int todayMinutes, int weekMinutes, int completedSessions, int weekDistractions, List<DateTime> lastWeekDays, List<int> lastWeekMinutes, Map<DateTime, int> minutesByDay, List<FocusSession> recentSessions, DateTime today
});


$StreakSummaryCopyWith<$Res> get streak;

}
/// @nodoc
class _$StatsStateCopyWithImpl<$Res>
    implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._self, this._then);

  final StatsState _self;
  final $Res Function(StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streak = null,Object? goalMinutes = null,Object? todayMinutes = null,Object? weekMinutes = null,Object? completedSessions = null,Object? weekDistractions = null,Object? lastWeekDays = null,Object? lastWeekMinutes = null,Object? minutesByDay = null,Object? recentSessions = null,Object? today = null,}) {
  return _then(StatsState(
streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,goalMinutes: null == goalMinutes ? _self.goalMinutes : goalMinutes // ignore: cast_nullable_to_non_nullable
as int,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,weekMinutes: null == weekMinutes ? _self.weekMinutes : weekMinutes // ignore: cast_nullable_to_non_nullable
as int,completedSessions: null == completedSessions ? _self.completedSessions : completedSessions // ignore: cast_nullable_to_non_nullable
as int,weekDistractions: null == weekDistractions ? _self.weekDistractions : weekDistractions // ignore: cast_nullable_to_non_nullable
as int,lastWeekDays: null == lastWeekDays ? _self.lastWeekDays : lastWeekDays // ignore: cast_nullable_to_non_nullable
as List<DateTime>,lastWeekMinutes: null == lastWeekMinutes ? _self.lastWeekMinutes : lastWeekMinutes // ignore: cast_nullable_to_non_nullable
as List<int>,minutesByDay: null == minutesByDay ? _self.minutesByDay : minutesByDay // ignore: cast_nullable_to_non_nullable
as Map<DateTime, int>,recentSessions: null == recentSessions ? _self.recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<FocusSession>,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakSummaryCopyWith<$Res> get streak {
  
  return $StreakSummaryCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// Adds pattern-matching-related methods to [StatsState].
extension StatsStatePatterns on StatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsState value)  $default,){
final _that = this;
switch (_that) {
case _StatsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsState value)?  $default,){
final _that = this;
switch (_that) {
case _StatsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StreakSummary streak,  int goalMinutes,  int todayMinutes,  int weekMinutes,  int completedSessions,  int weekDistractions,  List<DateTime> lastWeekDays,  List<int> lastWeekMinutes,  Map<DateTime, int> minutesByDay,  List<FocusSession> recentSessions,  DateTime today)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.streak,_that.goalMinutes,_that.todayMinutes,_that.weekMinutes,_that.completedSessions,_that.weekDistractions,_that.lastWeekDays,_that.lastWeekMinutes,_that.minutesByDay,_that.recentSessions,_that.today);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StreakSummary streak,  int goalMinutes,  int todayMinutes,  int weekMinutes,  int completedSessions,  int weekDistractions,  List<DateTime> lastWeekDays,  List<int> lastWeekMinutes,  Map<DateTime, int> minutesByDay,  List<FocusSession> recentSessions,  DateTime today)  $default,) {final _that = this;
switch (_that) {
case _StatsState():
return $default(_that.streak,_that.goalMinutes,_that.todayMinutes,_that.weekMinutes,_that.completedSessions,_that.weekDistractions,_that.lastWeekDays,_that.lastWeekMinutes,_that.minutesByDay,_that.recentSessions,_that.today);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StreakSummary streak,  int goalMinutes,  int todayMinutes,  int weekMinutes,  int completedSessions,  int weekDistractions,  List<DateTime> lastWeekDays,  List<int> lastWeekMinutes,  Map<DateTime, int> minutesByDay,  List<FocusSession> recentSessions,  DateTime today)?  $default,) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.streak,_that.goalMinutes,_that.todayMinutes,_that.weekMinutes,_that.completedSessions,_that.weekDistractions,_that.lastWeekDays,_that.lastWeekMinutes,_that.minutesByDay,_that.recentSessions,_that.today);case _:
  return null;

}
}

}

/// @nodoc


class _StatsState extends StatsState {
  const _StatsState({required this.streak, required this.goalMinutes, required this.todayMinutes, required this.weekMinutes, required this.completedSessions, required this.weekDistractions, required  List<DateTime> lastWeekDays, required  List<int> lastWeekMinutes, required  Map<DateTime, int> minutesByDay, required  List<FocusSession> recentSessions, required this.today}): _lastWeekDays = lastWeekDays,_lastWeekMinutes = lastWeekMinutes,_minutesByDay = minutesByDay,_recentSessions = recentSessions,super._();
  

@override final  StreakSummary streak;
@override final  int goalMinutes;
@override final  int todayMinutes;
@override final  int weekMinutes;
@override final  int completedSessions;
@override final  int weekDistractions;
/// Últimos 7 días, del más antiguo a hoy.
 final  List<DateTime> _lastWeekDays;
/// Últimos 7 días, del más antiguo a hoy.
@override List<DateTime> get lastWeekDays {
  if (_lastWeekDays is EqualUnmodifiableListView) return _lastWeekDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lastWeekDays);
}

 final  List<int> _lastWeekMinutes;
@override List<int> get lastWeekMinutes {
  if (_lastWeekMinutes is EqualUnmodifiableListView) return _lastWeekMinutes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lastWeekMinutes);
}

 final  Map<DateTime, int> _minutesByDay;
@override Map<DateTime, int> get minutesByDay {
  if (_minutesByDay is EqualUnmodifiableMapView) return _minutesByDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_minutesByDay);
}

 final  List<FocusSession> _recentSessions;
@override List<FocusSession> get recentSessions {
  if (_recentSessions is EqualUnmodifiableListView) return _recentSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSessions);
}

@override final  DateTime today;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsStateCopyWith<_StatsState> get copyWith => __$StatsStateCopyWithImpl<_StatsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsState&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.goalMinutes, goalMinutes) || other.goalMinutes == goalMinutes)&&(identical(other.todayMinutes, todayMinutes) || other.todayMinutes == todayMinutes)&&(identical(other.weekMinutes, weekMinutes) || other.weekMinutes == weekMinutes)&&(identical(other.completedSessions, completedSessions) || other.completedSessions == completedSessions)&&(identical(other.weekDistractions, weekDistractions) || other.weekDistractions == weekDistractions)&&const DeepCollectionEquality().equals(other.lastWeekDays, _lastWeekDays)&&const DeepCollectionEquality().equals(other.lastWeekMinutes, _lastWeekMinutes)&&const DeepCollectionEquality().equals(other.minutesByDay, _minutesByDay)&&const DeepCollectionEquality().equals(other.recentSessions, _recentSessions)&&(identical(other.today, today) || other.today == today));
}


@override
int get hashCode {
    return Object.hash(runtimeType,streak,goalMinutes,todayMinutes,weekMinutes,completedSessions,weekDistractions,const DeepCollectionEquality().hash(_lastWeekDays),const DeepCollectionEquality().hash(_lastWeekMinutes),const DeepCollectionEquality().hash(_minutesByDay),const DeepCollectionEquality().hash(_recentSessions),today);
}

@override
String toString() {
    return 'StatsState(streak: $streak, goalMinutes: $goalMinutes, todayMinutes: $todayMinutes, weekMinutes: $weekMinutes, completedSessions: $completedSessions, weekDistractions: $weekDistractions, lastWeekDays: $lastWeekDays, lastWeekMinutes: $lastWeekMinutes, minutesByDay: $minutesByDay, recentSessions: $recentSessions, today: $today)';
}


}

/// @nodoc
abstract mixin class _$StatsStateCopyWith<$Res> implements $StatsStateCopyWith<$Res> {
  factory _$StatsStateCopyWith(_StatsState value, $Res Function(_StatsState) _then) = __$StatsStateCopyWithImpl;
@override @useResult
$Res call({
 StreakSummary streak, int goalMinutes, int todayMinutes, int weekMinutes, int completedSessions, int weekDistractions, List<DateTime> lastWeekDays, List<int> lastWeekMinutes, Map<DateTime, int> minutesByDay, List<FocusSession> recentSessions, DateTime today
});


@override $StreakSummaryCopyWith<$Res> get streak;

}
/// @nodoc
class __$StatsStateCopyWithImpl<$Res>
    implements _$StatsStateCopyWith<$Res> {
  __$StatsStateCopyWithImpl(this._self, this._then);

  final _StatsState _self;
  final $Res Function(_StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streak = null,Object? goalMinutes = null,Object? todayMinutes = null,Object? weekMinutes = null,Object? completedSessions = null,Object? weekDistractions = null,Object? lastWeekDays = null,Object? lastWeekMinutes = null,Object? minutesByDay = null,Object? recentSessions = null,Object? today = null,}) {
  return _then(_StatsState(
streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,goalMinutes: null == goalMinutes ? _self.goalMinutes : goalMinutes // ignore: cast_nullable_to_non_nullable
as int,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,weekMinutes: null == weekMinutes ? _self.weekMinutes : weekMinutes // ignore: cast_nullable_to_non_nullable
as int,completedSessions: null == completedSessions ? _self.completedSessions : completedSessions // ignore: cast_nullable_to_non_nullable
as int,weekDistractions: null == weekDistractions ? _self.weekDistractions : weekDistractions // ignore: cast_nullable_to_non_nullable
as int,lastWeekDays: null == lastWeekDays ? _self._lastWeekDays : lastWeekDays // ignore: cast_nullable_to_non_nullable
as List<DateTime>,lastWeekMinutes: null == lastWeekMinutes ? _self._lastWeekMinutes : lastWeekMinutes // ignore: cast_nullable_to_non_nullable
as List<int>,minutesByDay: null == minutesByDay ? _self._minutesByDay : minutesByDay // ignore: cast_nullable_to_non_nullable
as Map<DateTime, int>,recentSessions: null == recentSessions ? _self._recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<FocusSession>,today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakSummaryCopyWith<$Res> get streak {
  
  return $StreakSummaryCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}

// dart format on
