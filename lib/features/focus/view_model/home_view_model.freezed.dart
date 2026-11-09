// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 AppSettings get settings; StreakSummary get streak; DateTime get now; int get todayMinutes; int get todaySessions; int get todayExits;/// Minutos de lunes a domingo de esta semana.
 List<int> get week; int get weekTotal;/// Cambio frente a la semana pasada; `null` si no hay con qué comparar.
 int? get weekChange; bool get starting;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.settings, _this.settings) || other.settings == _this.settings)&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.now, _this.now) || other.now == _this.now)&&(identical(other.todayMinutes, _this.todayMinutes) || other.todayMinutes == _this.todayMinutes)&&(identical(other.todaySessions, _this.todaySessions) || other.todaySessions == _this.todaySessions)&&(identical(other.todayExits, _this.todayExits) || other.todayExits == _this.todayExits)&&const DeepCollectionEquality().equals(other.week, _this.week)&&(identical(other.weekTotal, _this.weekTotal) || other.weekTotal == _this.weekTotal)&&(identical(other.weekChange, _this.weekChange) || other.weekChange == _this.weekChange)&&(identical(other.starting, _this.starting) || other.starting == _this.starting));
}


@override
int get hashCode {
  final _this = this as HomeState;
  return Object.hash(runtimeType,_this.settings,_this.streak,_this.now,_this.todayMinutes,_this.todaySessions,_this.todayExits,const DeepCollectionEquality().hash(_this.week),_this.weekTotal,_this.weekChange,_this.starting);
}

@override
String toString() {
  final _this = this as HomeState;
  return 'HomeState(settings: ${_this.settings}, streak: ${_this.streak}, now: ${_this.now}, todayMinutes: ${_this.todayMinutes}, todaySessions: ${_this.todaySessions}, todayExits: ${_this.todayExits}, week: ${_this.week}, weekTotal: ${_this.weekTotal}, weekChange: ${_this.weekChange}, starting: ${_this.starting})';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 AppSettings settings, StreakSummary streak, DateTime now, int todayMinutes, int todaySessions, int todayExits, List<int> week, int weekTotal, int? weekChange, bool starting
});


$AppSettingsCopyWith<$Res> get settings;$StreakSummaryCopyWith<$Res> get streak;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? settings = null,Object? streak = null,Object? now = null,Object? todayMinutes = null,Object? todaySessions = null,Object? todayExits = null,Object? week = null,Object? weekTotal = null,Object? weekChange = freezed,Object? starting = null,}) {
  return _then(HomeState(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,todaySessions: null == todaySessions ? _self.todaySessions : todaySessions // ignore: cast_nullable_to_non_nullable
as int,todayExits: null == todayExits ? _self.todayExits : todayExits // ignore: cast_nullable_to_non_nullable
as int,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as List<int>,weekTotal: null == weekTotal ? _self.weekTotal : weekTotal // ignore: cast_nullable_to_non_nullable
as int,weekChange: freezed == weekChange ? _self.weekChange : weekChange // ignore: cast_nullable_to_non_nullable
as int?,starting: null == starting ? _self.starting : starting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<$Res> get settings {
  
  return $AppSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakSummaryCopyWith<$Res> get streak {
  
  return $StreakSummaryCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppSettings settings,  StreakSummary streak,  DateTime now,  int todayMinutes,  int todaySessions,  int todayExits,  List<int> week,  int weekTotal,  int? weekChange,  bool starting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.settings,_that.streak,_that.now,_that.todayMinutes,_that.todaySessions,_that.todayExits,_that.week,_that.weekTotal,_that.weekChange,_that.starting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppSettings settings,  StreakSummary streak,  DateTime now,  int todayMinutes,  int todaySessions,  int todayExits,  List<int> week,  int weekTotal,  int? weekChange,  bool starting)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.settings,_that.streak,_that.now,_that.todayMinutes,_that.todaySessions,_that.todayExits,_that.week,_that.weekTotal,_that.weekChange,_that.starting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppSettings settings,  StreakSummary streak,  DateTime now,  int todayMinutes,  int todaySessions,  int todayExits,  List<int> week,  int weekTotal,  int? weekChange,  bool starting)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.settings,_that.streak,_that.now,_that.todayMinutes,_that.todaySessions,_that.todayExits,_that.week,_that.weekTotal,_that.weekChange,_that.starting);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({required this.settings, required this.streak, required this.now, required this.todayMinutes, required this.todaySessions, required this.todayExits, required  List<int> week, required this.weekTotal, this.weekChange, this.starting = false}): _week = week,super._();
  

@override final  AppSettings settings;
@override final  StreakSummary streak;
@override final  DateTime now;
@override final  int todayMinutes;
@override final  int todaySessions;
@override final  int todayExits;
/// Minutos de lunes a domingo de esta semana.
 final  List<int> _week;
/// Minutos de lunes a domingo de esta semana.
@override List<int> get week {
  if (_week is EqualUnmodifiableListView) return _week;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_week);
}

@override final  int weekTotal;
/// Cambio frente a la semana pasada; `null` si no hay con qué comparar.
@override final  int? weekChange;
@override@JsonKey() final  bool starting;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.now, now) || other.now == now)&&(identical(other.todayMinutes, todayMinutes) || other.todayMinutes == todayMinutes)&&(identical(other.todaySessions, todaySessions) || other.todaySessions == todaySessions)&&(identical(other.todayExits, todayExits) || other.todayExits == todayExits)&&const DeepCollectionEquality().equals(other.week, _week)&&(identical(other.weekTotal, weekTotal) || other.weekTotal == weekTotal)&&(identical(other.weekChange, weekChange) || other.weekChange == weekChange)&&(identical(other.starting, starting) || other.starting == starting));
}


@override
int get hashCode {
    return Object.hash(runtimeType,settings,streak,now,todayMinutes,todaySessions,todayExits,const DeepCollectionEquality().hash(_week),weekTotal,weekChange,starting);
}

@override
String toString() {
    return 'HomeState(settings: $settings, streak: $streak, now: $now, todayMinutes: $todayMinutes, todaySessions: $todaySessions, todayExits: $todayExits, week: $week, weekTotal: $weekTotal, weekChange: $weekChange, starting: $starting)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 AppSettings settings, StreakSummary streak, DateTime now, int todayMinutes, int todaySessions, int todayExits, List<int> week, int weekTotal, int? weekChange, bool starting
});


@override $AppSettingsCopyWith<$Res> get settings;@override $StreakSummaryCopyWith<$Res> get streak;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? settings = null,Object? streak = null,Object? now = null,Object? todayMinutes = null,Object? todaySessions = null,Object? todayExits = null,Object? week = null,Object? weekTotal = null,Object? weekChange = freezed,Object? starting = null,}) {
  return _then(_HomeState(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,todaySessions: null == todaySessions ? _self.todaySessions : todaySessions // ignore: cast_nullable_to_non_nullable
as int,todayExits: null == todayExits ? _self.todayExits : todayExits // ignore: cast_nullable_to_non_nullable
as int,week: null == week ? _self._week : week // ignore: cast_nullable_to_non_nullable
as List<int>,weekTotal: null == weekTotal ? _self.weekTotal : weekTotal // ignore: cast_nullable_to_non_nullable
as int,weekChange: freezed == weekChange ? _self.weekChange : weekChange // ignore: cast_nullable_to_non_nullable
as int?,starting: null == starting ? _self.starting : starting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<$Res> get settings {
  
  return $AppSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of HomeState
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
