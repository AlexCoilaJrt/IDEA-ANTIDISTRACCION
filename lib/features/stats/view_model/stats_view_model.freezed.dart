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
mixin _$TopDistraction {

 String get label; int get attempts;/// Total de intentos del período y del anterior.
 int get total; int get previousTotal; Uint8List? get icon;
/// Create a copy of TopDistraction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopDistractionCopyWith<TopDistraction> get copyWith => _$TopDistractionCopyWithImpl<TopDistraction>(this as TopDistraction, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TopDistraction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopDistraction&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.attempts, _this.attempts) || other.attempts == _this.attempts)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.previousTotal, _this.previousTotal) || other.previousTotal == _this.previousTotal)&&const DeepCollectionEquality().equals(other.icon, _this.icon));
}


@override
int get hashCode {
  final _this = this as TopDistraction;
  return Object.hash(runtimeType,_this.label,_this.attempts,_this.total,_this.previousTotal,const DeepCollectionEquality().hash(_this.icon));
}

@override
String toString() {
  final _this = this as TopDistraction;
  return 'TopDistraction(label: ${_this.label}, attempts: ${_this.attempts}, total: ${_this.total}, previousTotal: ${_this.previousTotal}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $TopDistractionCopyWith<$Res>  {
  factory $TopDistractionCopyWith(TopDistraction value, $Res Function(TopDistraction) _then) = _$TopDistractionCopyWithImpl;
@useResult
$Res call({
 String label, int attempts, int total, int previousTotal, Uint8List? icon
});




}
/// @nodoc
class _$TopDistractionCopyWithImpl<$Res>
    implements $TopDistractionCopyWith<$Res> {
  _$TopDistractionCopyWithImpl(this._self, this._then);

  final TopDistraction _self;
  final $Res Function(TopDistraction) _then;

/// Create a copy of TopDistraction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? attempts = null,Object? total = null,Object? previousTotal = null,Object? icon = freezed,}) {
  return _then(TopDistraction(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,previousTotal: null == previousTotal ? _self.previousTotal : previousTotal // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopDistraction].
extension TopDistractionPatterns on TopDistraction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopDistraction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopDistraction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopDistraction value)  $default,){
final _that = this;
switch (_that) {
case _TopDistraction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopDistraction value)?  $default,){
final _that = this;
switch (_that) {
case _TopDistraction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  int attempts,  int total,  int previousTotal,  Uint8List? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopDistraction() when $default != null:
return $default(_that.label,_that.attempts,_that.total,_that.previousTotal,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  int attempts,  int total,  int previousTotal,  Uint8List? icon)  $default,) {final _that = this;
switch (_that) {
case _TopDistraction():
return $default(_that.label,_that.attempts,_that.total,_that.previousTotal,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  int attempts,  int total,  int previousTotal,  Uint8List? icon)?  $default,) {final _that = this;
switch (_that) {
case _TopDistraction() when $default != null:
return $default(_that.label,_that.attempts,_that.total,_that.previousTotal,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _TopDistraction extends TopDistraction {
  const _TopDistraction({required this.label, required this.attempts, required this.total, required this.previousTotal, this.icon}): super._();
  

@override final  String label;
@override final  int attempts;
/// Total de intentos del período y del anterior.
@override final  int total;
@override final  int previousTotal;
@override final  Uint8List? icon;

/// Create a copy of TopDistraction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopDistractionCopyWith<_TopDistraction> get copyWith => __$TopDistractionCopyWithImpl<_TopDistraction>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopDistraction&&(identical(other.label, label) || other.label == label)&&(identical(other.attempts, attempts) || other.attempts == attempts)&&(identical(other.total, total) || other.total == total)&&(identical(other.previousTotal, previousTotal) || other.previousTotal == previousTotal)&&const DeepCollectionEquality().equals(other.icon, icon));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,attempts,total,previousTotal,const DeepCollectionEquality().hash(icon));
}

@override
String toString() {
    return 'TopDistraction(label: $label, attempts: $attempts, total: $total, previousTotal: $previousTotal, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$TopDistractionCopyWith<$Res> implements $TopDistractionCopyWith<$Res> {
  factory _$TopDistractionCopyWith(_TopDistraction value, $Res Function(_TopDistraction) _then) = __$TopDistractionCopyWithImpl;
@override @useResult
$Res call({
 String label, int attempts, int total, int previousTotal, Uint8List? icon
});




}
/// @nodoc
class __$TopDistractionCopyWithImpl<$Res>
    implements _$TopDistractionCopyWith<$Res> {
  __$TopDistractionCopyWithImpl(this._self, this._then);

  final _TopDistraction _self;
  final $Res Function(_TopDistraction) _then;

/// Create a copy of TopDistraction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? attempts = null,Object? total = null,Object? previousTotal = null,Object? icon = freezed,}) {
  return _then(_TopDistraction(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,previousTotal: null == previousTotal ? _self.previousTotal : previousTotal // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc
mixin _$StatsState {

 StatsPeriod get period; DateTime get now; StreakSummary get streak; int get totalMinutes; int? get change; int? get completionRate; List<StatsBar> get bars; Map<DateTime, int> get minutesByDay;/// Minutos por materia (`null` = sin materia), de mayor a menor.
 List<MapEntry<String?, int>> get subjects; int get distractionTotal; TopDistraction? get topDistraction; List<FocusSession> get recentSessions;
/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsStateCopyWith<StatsState> get copyWith => _$StatsStateCopyWithImpl<StatsState>(this as StatsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StatsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsState&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.now, _this.now) || other.now == _this.now)&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.totalMinutes, _this.totalMinutes) || other.totalMinutes == _this.totalMinutes)&&(identical(other.change, _this.change) || other.change == _this.change)&&(identical(other.completionRate, _this.completionRate) || other.completionRate == _this.completionRate)&&const DeepCollectionEquality().equals(other.bars, _this.bars)&&const DeepCollectionEquality().equals(other.minutesByDay, _this.minutesByDay)&&const DeepCollectionEquality().equals(other.subjects, _this.subjects)&&(identical(other.distractionTotal, _this.distractionTotal) || other.distractionTotal == _this.distractionTotal)&&(identical(other.topDistraction, _this.topDistraction) || other.topDistraction == _this.topDistraction)&&const DeepCollectionEquality().equals(other.recentSessions, _this.recentSessions));
}


@override
int get hashCode {
  final _this = this as StatsState;
  return Object.hash(runtimeType,_this.period,_this.now,_this.streak,_this.totalMinutes,_this.change,_this.completionRate,const DeepCollectionEquality().hash(_this.bars),const DeepCollectionEquality().hash(_this.minutesByDay),const DeepCollectionEquality().hash(_this.subjects),_this.distractionTotal,_this.topDistraction,const DeepCollectionEquality().hash(_this.recentSessions));
}

@override
String toString() {
  final _this = this as StatsState;
  return 'StatsState(period: ${_this.period}, now: ${_this.now}, streak: ${_this.streak}, totalMinutes: ${_this.totalMinutes}, change: ${_this.change}, completionRate: ${_this.completionRate}, bars: ${_this.bars}, minutesByDay: ${_this.minutesByDay}, subjects: ${_this.subjects}, distractionTotal: ${_this.distractionTotal}, topDistraction: ${_this.topDistraction}, recentSessions: ${_this.recentSessions})';
}


}

/// @nodoc
abstract mixin class $StatsStateCopyWith<$Res>  {
  factory $StatsStateCopyWith(StatsState value, $Res Function(StatsState) _then) = _$StatsStateCopyWithImpl;
@useResult
$Res call({
 StatsPeriod period, DateTime now, StreakSummary streak, int totalMinutes, int? change, int? completionRate, List<StatsBar> bars, Map<DateTime, int> minutesByDay, List<MapEntry<String?, int>> subjects, int distractionTotal, TopDistraction? topDistraction, List<FocusSession> recentSessions
});


$StreakSummaryCopyWith<$Res> get streak;$TopDistractionCopyWith<$Res>? get topDistraction;

}
/// @nodoc
class _$StatsStateCopyWithImpl<$Res>
    implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._self, this._then);

  final StatsState _self;
  final $Res Function(StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? now = null,Object? streak = null,Object? totalMinutes = null,Object? change = freezed,Object? completionRate = freezed,Object? bars = null,Object? minutesByDay = null,Object? subjects = null,Object? distractionTotal = null,Object? topDistraction = freezed,Object? recentSessions = null,}) {
  return _then(StatsState(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as StatsPeriod,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int?,completionRate: freezed == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as int?,bars: null == bars ? _self.bars : bars // ignore: cast_nullable_to_non_nullable
as List<StatsBar>,minutesByDay: null == minutesByDay ? _self.minutesByDay : minutesByDay // ignore: cast_nullable_to_non_nullable
as Map<DateTime, int>,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<MapEntry<String?, int>>,distractionTotal: null == distractionTotal ? _self.distractionTotal : distractionTotal // ignore: cast_nullable_to_non_nullable
as int,topDistraction: freezed == topDistraction ? _self.topDistraction : topDistraction // ignore: cast_nullable_to_non_nullable
as TopDistraction?,recentSessions: null == recentSessions ? _self.recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<FocusSession>,
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
}/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopDistractionCopyWith<$Res>? get topDistraction {
    if (_self.topDistraction == null) {
    return null;
  }

  return $TopDistractionCopyWith<$Res>(_self.topDistraction!, (value) {
    return _then(_self.copyWith(topDistraction: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatsPeriod period,  DateTime now,  StreakSummary streak,  int totalMinutes,  int? change,  int? completionRate,  List<StatsBar> bars,  Map<DateTime, int> minutesByDay,  List<MapEntry<String?, int>> subjects,  int distractionTotal,  TopDistraction? topDistraction,  List<FocusSession> recentSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.period,_that.now,_that.streak,_that.totalMinutes,_that.change,_that.completionRate,_that.bars,_that.minutesByDay,_that.subjects,_that.distractionTotal,_that.topDistraction,_that.recentSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatsPeriod period,  DateTime now,  StreakSummary streak,  int totalMinutes,  int? change,  int? completionRate,  List<StatsBar> bars,  Map<DateTime, int> minutesByDay,  List<MapEntry<String?, int>> subjects,  int distractionTotal,  TopDistraction? topDistraction,  List<FocusSession> recentSessions)  $default,) {final _that = this;
switch (_that) {
case _StatsState():
return $default(_that.period,_that.now,_that.streak,_that.totalMinutes,_that.change,_that.completionRate,_that.bars,_that.minutesByDay,_that.subjects,_that.distractionTotal,_that.topDistraction,_that.recentSessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatsPeriod period,  DateTime now,  StreakSummary streak,  int totalMinutes,  int? change,  int? completionRate,  List<StatsBar> bars,  Map<DateTime, int> minutesByDay,  List<MapEntry<String?, int>> subjects,  int distractionTotal,  TopDistraction? topDistraction,  List<FocusSession> recentSessions)?  $default,) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.period,_that.now,_that.streak,_that.totalMinutes,_that.change,_that.completionRate,_that.bars,_that.minutesByDay,_that.subjects,_that.distractionTotal,_that.topDistraction,_that.recentSessions);case _:
  return null;

}
}

}

/// @nodoc


class _StatsState extends StatsState {
  const _StatsState({required this.period, required this.now, required this.streak, required this.totalMinutes, this.change, this.completionRate, required  List<StatsBar> bars, required  Map<DateTime, int> minutesByDay, required  List<MapEntry<String?, int>> subjects, required this.distractionTotal, this.topDistraction, required  List<FocusSession> recentSessions}): _bars = bars,_minutesByDay = minutesByDay,_subjects = subjects,_recentSessions = recentSessions,super._();
  

@override final  StatsPeriod period;
@override final  DateTime now;
@override final  StreakSummary streak;
@override final  int totalMinutes;
@override final  int? change;
@override final  int? completionRate;
 final  List<StatsBar> _bars;
@override List<StatsBar> get bars {
  if (_bars is EqualUnmodifiableListView) return _bars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bars);
}

 final  Map<DateTime, int> _minutesByDay;
@override Map<DateTime, int> get minutesByDay {
  if (_minutesByDay is EqualUnmodifiableMapView) return _minutesByDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_minutesByDay);
}

/// Minutos por materia (`null` = sin materia), de mayor a menor.
 final  List<MapEntry<String?, int>> _subjects;
/// Minutos por materia (`null` = sin materia), de mayor a menor.
@override List<MapEntry<String?, int>> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

@override final  int distractionTotal;
@override final  TopDistraction? topDistraction;
 final  List<FocusSession> _recentSessions;
@override List<FocusSession> get recentSessions {
  if (_recentSessions is EqualUnmodifiableListView) return _recentSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSessions);
}


/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsStateCopyWith<_StatsState> get copyWith => __$StatsStateCopyWithImpl<_StatsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsState&&(identical(other.period, period) || other.period == period)&&(identical(other.now, now) || other.now == now)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.change, change) || other.change == change)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&const DeepCollectionEquality().equals(other.bars, _bars)&&const DeepCollectionEquality().equals(other.minutesByDay, _minutesByDay)&&const DeepCollectionEquality().equals(other.subjects, _subjects)&&(identical(other.distractionTotal, distractionTotal) || other.distractionTotal == distractionTotal)&&(identical(other.topDistraction, topDistraction) || other.topDistraction == topDistraction)&&const DeepCollectionEquality().equals(other.recentSessions, _recentSessions));
}


@override
int get hashCode {
    return Object.hash(runtimeType,period,now,streak,totalMinutes,change,completionRate,const DeepCollectionEquality().hash(_bars),const DeepCollectionEquality().hash(_minutesByDay),const DeepCollectionEquality().hash(_subjects),distractionTotal,topDistraction,const DeepCollectionEquality().hash(_recentSessions));
}

@override
String toString() {
    return 'StatsState(period: $period, now: $now, streak: $streak, totalMinutes: $totalMinutes, change: $change, completionRate: $completionRate, bars: $bars, minutesByDay: $minutesByDay, subjects: $subjects, distractionTotal: $distractionTotal, topDistraction: $topDistraction, recentSessions: $recentSessions)';
}


}

/// @nodoc
abstract mixin class _$StatsStateCopyWith<$Res> implements $StatsStateCopyWith<$Res> {
  factory _$StatsStateCopyWith(_StatsState value, $Res Function(_StatsState) _then) = __$StatsStateCopyWithImpl;
@override @useResult
$Res call({
 StatsPeriod period, DateTime now, StreakSummary streak, int totalMinutes, int? change, int? completionRate, List<StatsBar> bars, Map<DateTime, int> minutesByDay, List<MapEntry<String?, int>> subjects, int distractionTotal, TopDistraction? topDistraction, List<FocusSession> recentSessions
});


@override $StreakSummaryCopyWith<$Res> get streak;@override $TopDistractionCopyWith<$Res>? get topDistraction;

}
/// @nodoc
class __$StatsStateCopyWithImpl<$Res>
    implements _$StatsStateCopyWith<$Res> {
  __$StatsStateCopyWithImpl(this._self, this._then);

  final _StatsState _self;
  final $Res Function(_StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? now = null,Object? streak = null,Object? totalMinutes = null,Object? change = freezed,Object? completionRate = freezed,Object? bars = null,Object? minutesByDay = null,Object? subjects = null,Object? distractionTotal = null,Object? topDistraction = freezed,Object? recentSessions = null,}) {
  return _then(_StatsState(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as StatsPeriod,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int?,completionRate: freezed == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as int?,bars: null == bars ? _self._bars : bars // ignore: cast_nullable_to_non_nullable
as List<StatsBar>,minutesByDay: null == minutesByDay ? _self._minutesByDay : minutesByDay // ignore: cast_nullable_to_non_nullable
as Map<DateTime, int>,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<MapEntry<String?, int>>,distractionTotal: null == distractionTotal ? _self.distractionTotal : distractionTotal // ignore: cast_nullable_to_non_nullable
as int,topDistraction: freezed == topDistraction ? _self.topDistraction : topDistraction // ignore: cast_nullable_to_non_nullable
as TopDistraction?,recentSessions: null == recentSessions ? _self._recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<FocusSession>,
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
}/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopDistractionCopyWith<$Res>? get topDistraction {
    if (_self.topDistraction == null) {
    return null;
  }

  return $TopDistractionCopyWith<$Res>(_self.topDistraction!, (value) {
    return _then(_self.copyWith(topDistraction: value));
  });
}
}

// dart format on
