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

 AppSettings get settings; int get todayMinutes; StreakSummary get streak; DateTime get plannedEnd; DateTime get now; bool get starting;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.settings, _this.settings) || other.settings == _this.settings)&&(identical(other.todayMinutes, _this.todayMinutes) || other.todayMinutes == _this.todayMinutes)&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.plannedEnd, _this.plannedEnd) || other.plannedEnd == _this.plannedEnd)&&(identical(other.now, _this.now) || other.now == _this.now)&&(identical(other.starting, _this.starting) || other.starting == _this.starting));
}


@override
int get hashCode {
  final _this = this as HomeState;
  return Object.hash(runtimeType,_this.settings,_this.todayMinutes,_this.streak,_this.plannedEnd,_this.now,_this.starting);
}

@override
String toString() {
  final _this = this as HomeState;
  return 'HomeState(settings: ${_this.settings}, todayMinutes: ${_this.todayMinutes}, streak: ${_this.streak}, plannedEnd: ${_this.plannedEnd}, now: ${_this.now}, starting: ${_this.starting})';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 AppSettings settings, int todayMinutes, StreakSummary streak, DateTime plannedEnd, DateTime now, bool starting
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
@pragma('vm:prefer-inline') @override $Res call({Object? settings = null,Object? todayMinutes = null,Object? streak = null,Object? plannedEnd = null,Object? now = null,Object? starting = null,}) {
  return _then(HomeState(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,plannedEnd: null == plannedEnd ? _self.plannedEnd : plannedEnd // ignore: cast_nullable_to_non_nullable
as DateTime,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,starting: null == starting ? _self.starting : starting // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppSettings settings,  int todayMinutes,  StreakSummary streak,  DateTime plannedEnd,  DateTime now,  bool starting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.settings,_that.todayMinutes,_that.streak,_that.plannedEnd,_that.now,_that.starting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppSettings settings,  int todayMinutes,  StreakSummary streak,  DateTime plannedEnd,  DateTime now,  bool starting)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.settings,_that.todayMinutes,_that.streak,_that.plannedEnd,_that.now,_that.starting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppSettings settings,  int todayMinutes,  StreakSummary streak,  DateTime plannedEnd,  DateTime now,  bool starting)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.settings,_that.todayMinutes,_that.streak,_that.plannedEnd,_that.now,_that.starting);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({required this.settings, required this.todayMinutes, required this.streak, required this.plannedEnd, required this.now, this.starting = false}): super._();
  

@override final  AppSettings settings;
@override final  int todayMinutes;
@override final  StreakSummary streak;
@override final  DateTime plannedEnd;
@override final  DateTime now;
@override@JsonKey() final  bool starting;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.todayMinutes, todayMinutes) || other.todayMinutes == todayMinutes)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.plannedEnd, plannedEnd) || other.plannedEnd == plannedEnd)&&(identical(other.now, now) || other.now == now)&&(identical(other.starting, starting) || other.starting == starting));
}


@override
int get hashCode {
    return Object.hash(runtimeType,settings,todayMinutes,streak,plannedEnd,now,starting);
}

@override
String toString() {
    return 'HomeState(settings: $settings, todayMinutes: $todayMinutes, streak: $streak, plannedEnd: $plannedEnd, now: $now, starting: $starting)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 AppSettings settings, int todayMinutes, StreakSummary streak, DateTime plannedEnd, DateTime now, bool starting
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
@override @pragma('vm:prefer-inline') $Res call({Object? settings = null,Object? todayMinutes = null,Object? streak = null,Object? plannedEnd = null,Object? now = null,Object? starting = null,}) {
  return _then(_HomeState(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings,todayMinutes: null == todayMinutes ? _self.todayMinutes : todayMinutes // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as StreakSummary,plannedEnd: null == plannedEnd ? _self.plannedEnd : plannedEnd // ignore: cast_nullable_to_non_nullable
as DateTime,now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,starting: null == starting ? _self.starting : starting // ignore: cast_nullable_to_non_nullable
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
