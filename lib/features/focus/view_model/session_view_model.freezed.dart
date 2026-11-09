// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionUiState {

 FocusSession get session; PomodoroPhase get phase; List<AllowedApp> get allowedApps; int get distractionCount;/// El usuario tocó "Salir antes" en la pantalla de bloqueo nativa.
 bool get exitRequested;
/// Create a copy of SessionUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionUiStateCopyWith<SessionUiState> get copyWith => _$SessionUiStateCopyWithImpl<SessionUiState>(this as SessionUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionUiState&&(identical(other.session, _this.session) || other.session == _this.session)&&(identical(other.phase, _this.phase) || other.phase == _this.phase)&&const DeepCollectionEquality().equals(other.allowedApps, _this.allowedApps)&&(identical(other.distractionCount, _this.distractionCount) || other.distractionCount == _this.distractionCount)&&(identical(other.exitRequested, _this.exitRequested) || other.exitRequested == _this.exitRequested));
}


@override
int get hashCode {
  final _this = this as SessionUiState;
  return Object.hash(runtimeType,_this.session,_this.phase,const DeepCollectionEquality().hash(_this.allowedApps),_this.distractionCount,_this.exitRequested);
}

@override
String toString() {
  final _this = this as SessionUiState;
  return 'SessionUiState(session: ${_this.session}, phase: ${_this.phase}, allowedApps: ${_this.allowedApps}, distractionCount: ${_this.distractionCount}, exitRequested: ${_this.exitRequested})';
}


}

/// @nodoc
abstract mixin class $SessionUiStateCopyWith<$Res>  {
  factory $SessionUiStateCopyWith(SessionUiState value, $Res Function(SessionUiState) _then) = _$SessionUiStateCopyWithImpl;
@useResult
$Res call({
 FocusSession session, PomodoroPhase phase, List<AllowedApp> allowedApps, int distractionCount, bool exitRequested
});


$FocusSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$SessionUiStateCopyWithImpl<$Res>
    implements $SessionUiStateCopyWith<$Res> {
  _$SessionUiStateCopyWithImpl(this._self, this._then);

  final SessionUiState _self;
  final $Res Function(SessionUiState) _then;

/// Create a copy of SessionUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? phase = null,Object? allowedApps = null,Object? distractionCount = null,Object? exitRequested = null,}) {
  return _then(SessionUiState(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as FocusSession,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as PomodoroPhase,allowedApps: null == allowedApps ? _self.allowedApps : allowedApps // ignore: cast_nullable_to_non_nullable
as List<AllowedApp>,distractionCount: null == distractionCount ? _self.distractionCount : distractionCount // ignore: cast_nullable_to_non_nullable
as int,exitRequested: null == exitRequested ? _self.exitRequested : exitRequested // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SessionUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FocusSessionCopyWith<$Res> get session {
  
  return $FocusSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionUiState].
extension SessionUiStatePatterns on SessionUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionUiState value)  $default,){
final _that = this;
switch (_that) {
case _SessionUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionUiState value)?  $default,){
final _that = this;
switch (_that) {
case _SessionUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FocusSession session,  PomodoroPhase phase,  List<AllowedApp> allowedApps,  int distractionCount,  bool exitRequested)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionUiState() when $default != null:
return $default(_that.session,_that.phase,_that.allowedApps,_that.distractionCount,_that.exitRequested);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FocusSession session,  PomodoroPhase phase,  List<AllowedApp> allowedApps,  int distractionCount,  bool exitRequested)  $default,) {final _that = this;
switch (_that) {
case _SessionUiState():
return $default(_that.session,_that.phase,_that.allowedApps,_that.distractionCount,_that.exitRequested);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FocusSession session,  PomodoroPhase phase,  List<AllowedApp> allowedApps,  int distractionCount,  bool exitRequested)?  $default,) {final _that = this;
switch (_that) {
case _SessionUiState() when $default != null:
return $default(_that.session,_that.phase,_that.allowedApps,_that.distractionCount,_that.exitRequested);case _:
  return null;

}
}

}

/// @nodoc


class _SessionUiState implements SessionUiState {
  const _SessionUiState({required this.session, required this.phase, required  List<AllowedApp> allowedApps, this.distractionCount = 0, this.exitRequested = false}): _allowedApps = allowedApps;
  

@override final  FocusSession session;
@override final  PomodoroPhase phase;
 final  List<AllowedApp> _allowedApps;
@override List<AllowedApp> get allowedApps {
  if (_allowedApps is EqualUnmodifiableListView) return _allowedApps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedApps);
}

@override@JsonKey() final  int distractionCount;
/// El usuario tocó "Salir antes" en la pantalla de bloqueo nativa.
@override@JsonKey() final  bool exitRequested;

/// Create a copy of SessionUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionUiStateCopyWith<_SessionUiState> get copyWith => __$SessionUiStateCopyWithImpl<_SessionUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionUiState&&(identical(other.session, session) || other.session == session)&&(identical(other.phase, phase) || other.phase == phase)&&const DeepCollectionEquality().equals(other.allowedApps, _allowedApps)&&(identical(other.distractionCount, distractionCount) || other.distractionCount == distractionCount)&&(identical(other.exitRequested, exitRequested) || other.exitRequested == exitRequested));
}


@override
int get hashCode {
    return Object.hash(runtimeType,session,phase,const DeepCollectionEquality().hash(_allowedApps),distractionCount,exitRequested);
}

@override
String toString() {
    return 'SessionUiState(session: $session, phase: $phase, allowedApps: $allowedApps, distractionCount: $distractionCount, exitRequested: $exitRequested)';
}


}

/// @nodoc
abstract mixin class _$SessionUiStateCopyWith<$Res> implements $SessionUiStateCopyWith<$Res> {
  factory _$SessionUiStateCopyWith(_SessionUiState value, $Res Function(_SessionUiState) _then) = __$SessionUiStateCopyWithImpl;
@override @useResult
$Res call({
 FocusSession session, PomodoroPhase phase, List<AllowedApp> allowedApps, int distractionCount, bool exitRequested
});


@override $FocusSessionCopyWith<$Res> get session;

}
/// @nodoc
class __$SessionUiStateCopyWithImpl<$Res>
    implements _$SessionUiStateCopyWith<$Res> {
  __$SessionUiStateCopyWithImpl(this._self, this._then);

  final _SessionUiState _self;
  final $Res Function(_SessionUiState) _then;

/// Create a copy of SessionUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? phase = null,Object? allowedApps = null,Object? distractionCount = null,Object? exitRequested = null,}) {
  return _then(_SessionUiState(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as FocusSession,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as PomodoroPhase,allowedApps: null == allowedApps ? _self._allowedApps : allowedApps // ignore: cast_nullable_to_non_nullable
as List<AllowedApp>,distractionCount: null == distractionCount ? _self.distractionCount : distractionCount // ignore: cast_nullable_to_non_nullable
as int,exitRequested: null == exitRequested ? _self.exitRequested : exitRequested // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SessionUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FocusSessionCopyWith<$Res> get session {
  
  return $FocusSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
