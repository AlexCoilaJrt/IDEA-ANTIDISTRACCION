// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudyBlock {

/// Días con `DateTime.monday` (1) a `DateTime.sunday` (7).
 Set<int> get weekdays;/// Minutos desde la medianoche (18:00 = 1080).
 int get startMinute; int get id; PomodoroPreset get preset; int get cycles; int get freeMinutes;/// Materia o tema (opcional).
 String? get label; bool get enabled;
/// Create a copy of StudyBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudyBlockCopyWith<StudyBlock> get copyWith => _$StudyBlockCopyWithImpl<StudyBlock>(this as StudyBlock, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudyBlock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudyBlock&&const DeepCollectionEquality().equals(other.weekdays, _this.weekdays)&&(identical(other.startMinute, _this.startMinute) || other.startMinute == _this.startMinute)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.preset, _this.preset) || other.preset == _this.preset)&&(identical(other.cycles, _this.cycles) || other.cycles == _this.cycles)&&(identical(other.freeMinutes, _this.freeMinutes) || other.freeMinutes == _this.freeMinutes)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled));
}


@override
int get hashCode {
  final _this = this as StudyBlock;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.weekdays),_this.startMinute,_this.id,_this.preset,_this.cycles,_this.freeMinutes,_this.label,_this.enabled);
}

@override
String toString() {
  final _this = this as StudyBlock;
  return 'StudyBlock(weekdays: ${_this.weekdays}, startMinute: ${_this.startMinute}, id: ${_this.id}, preset: ${_this.preset}, cycles: ${_this.cycles}, freeMinutes: ${_this.freeMinutes}, label: ${_this.label}, enabled: ${_this.enabled})';
}


}

/// @nodoc
abstract mixin class $StudyBlockCopyWith<$Res>  {
  factory $StudyBlockCopyWith(StudyBlock value, $Res Function(StudyBlock) _then) = _$StudyBlockCopyWithImpl;
@useResult
$Res call({
 Set<int> weekdays, int startMinute, int id, PomodoroPreset preset, int cycles, int freeMinutes, String? label, bool enabled
});




}
/// @nodoc
class _$StudyBlockCopyWithImpl<$Res>
    implements $StudyBlockCopyWith<$Res> {
  _$StudyBlockCopyWithImpl(this._self, this._then);

  final StudyBlock _self;
  final $Res Function(StudyBlock) _then;

/// Create a copy of StudyBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekdays = null,Object? startMinute = null,Object? id = null,Object? preset = null,Object? cycles = null,Object? freeMinutes = null,Object? label = freezed,Object? enabled = null,}) {
  return _then(StudyBlock(
weekdays: null == weekdays ? _self.weekdays : weekdays // ignore: cast_nullable_to_non_nullable
as Set<int>,startMinute: null == startMinute ? _self.startMinute : startMinute // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PomodoroPreset,cycles: null == cycles ? _self.cycles : cycles // ignore: cast_nullable_to_non_nullable
as int,freeMinutes: null == freeMinutes ? _self.freeMinutes : freeMinutes // ignore: cast_nullable_to_non_nullable
as int,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudyBlock].
extension StudyBlockPatterns on StudyBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudyBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudyBlock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudyBlock value)  $default,){
final _that = this;
switch (_that) {
case _StudyBlock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudyBlock value)?  $default,){
final _that = this;
switch (_that) {
case _StudyBlock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<int> weekdays,  int startMinute,  int id,  PomodoroPreset preset,  int cycles,  int freeMinutes,  String? label,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudyBlock() when $default != null:
return $default(_that.weekdays,_that.startMinute,_that.id,_that.preset,_that.cycles,_that.freeMinutes,_that.label,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<int> weekdays,  int startMinute,  int id,  PomodoroPreset preset,  int cycles,  int freeMinutes,  String? label,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _StudyBlock():
return $default(_that.weekdays,_that.startMinute,_that.id,_that.preset,_that.cycles,_that.freeMinutes,_that.label,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<int> weekdays,  int startMinute,  int id,  PomodoroPreset preset,  int cycles,  int freeMinutes,  String? label,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _StudyBlock() when $default != null:
return $default(_that.weekdays,_that.startMinute,_that.id,_that.preset,_that.cycles,_that.freeMinutes,_that.label,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _StudyBlock extends StudyBlock {
  const _StudyBlock({required  Set<int> weekdays, required this.startMinute, this.id = 0, this.preset = PomodoroPreset.classic, this.cycles = 1, this.freeMinutes = 45, this.label, this.enabled = true}): _weekdays = weekdays,super._();
  

/// Días con `DateTime.monday` (1) a `DateTime.sunday` (7).
 final  Set<int> _weekdays;
/// Días con `DateTime.monday` (1) a `DateTime.sunday` (7).
@override Set<int> get weekdays {
  if (_weekdays is EqualUnmodifiableSetView) return _weekdays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_weekdays);
}

/// Minutos desde la medianoche (18:00 = 1080).
@override final  int startMinute;
@override@JsonKey() final  int id;
@override@JsonKey() final  PomodoroPreset preset;
@override@JsonKey() final  int cycles;
@override@JsonKey() final  int freeMinutes;
/// Materia o tema (opcional).
@override final  String? label;
@override@JsonKey() final  bool enabled;

/// Create a copy of StudyBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudyBlockCopyWith<_StudyBlock> get copyWith => __$StudyBlockCopyWithImpl<_StudyBlock>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudyBlock&&const DeepCollectionEquality().equals(other.weekdays, _weekdays)&&(identical(other.startMinute, startMinute) || other.startMinute == startMinute)&&(identical(other.id, id) || other.id == id)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.cycles, cycles) || other.cycles == cycles)&&(identical(other.freeMinutes, freeMinutes) || other.freeMinutes == freeMinutes)&&(identical(other.label, label) || other.label == label)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_weekdays),startMinute,id,preset,cycles,freeMinutes,label,enabled);
}

@override
String toString() {
    return 'StudyBlock(weekdays: $weekdays, startMinute: $startMinute, id: $id, preset: $preset, cycles: $cycles, freeMinutes: $freeMinutes, label: $label, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$StudyBlockCopyWith<$Res> implements $StudyBlockCopyWith<$Res> {
  factory _$StudyBlockCopyWith(_StudyBlock value, $Res Function(_StudyBlock) _then) = __$StudyBlockCopyWithImpl;
@override @useResult
$Res call({
 Set<int> weekdays, int startMinute, int id, PomodoroPreset preset, int cycles, int freeMinutes, String? label, bool enabled
});




}
/// @nodoc
class __$StudyBlockCopyWithImpl<$Res>
    implements _$StudyBlockCopyWith<$Res> {
  __$StudyBlockCopyWithImpl(this._self, this._then);

  final _StudyBlock _self;
  final $Res Function(_StudyBlock) _then;

/// Create a copy of StudyBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekdays = null,Object? startMinute = null,Object? id = null,Object? preset = null,Object? cycles = null,Object? freeMinutes = null,Object? label = freezed,Object? enabled = null,}) {
  return _then(_StudyBlock(
weekdays: null == weekdays ? _self._weekdays : weekdays // ignore: cast_nullable_to_non_nullable
as Set<int>,startMinute: null == startMinute ? _self.startMinute : startMinute // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PomodoroPreset,cycles: null == cycles ? _self.cycles : cycles // ignore: cast_nullable_to_non_nullable
as int,freeMinutes: null == freeMinutes ? _self.freeMinutes : freeMinutes // ignore: cast_nullable_to_non_nullable
as int,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ScheduledOccurrence {

 StudyBlock get block; DateTime get start;
/// Create a copy of ScheduledOccurrence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduledOccurrenceCopyWith<ScheduledOccurrence> get copyWith => _$ScheduledOccurrenceCopyWithImpl<ScheduledOccurrence>(this as ScheduledOccurrence, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScheduledOccurrence;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduledOccurrence&&(identical(other.block, _this.block) || other.block == _this.block)&&(identical(other.start, _this.start) || other.start == _this.start));
}


@override
int get hashCode {
  final _this = this as ScheduledOccurrence;
  return Object.hash(runtimeType,_this.block,_this.start);
}

@override
String toString() {
  final _this = this as ScheduledOccurrence;
  return 'ScheduledOccurrence(block: ${_this.block}, start: ${_this.start})';
}


}

/// @nodoc
abstract mixin class $ScheduledOccurrenceCopyWith<$Res>  {
  factory $ScheduledOccurrenceCopyWith(ScheduledOccurrence value, $Res Function(ScheduledOccurrence) _then) = _$ScheduledOccurrenceCopyWithImpl;
@useResult
$Res call({
 StudyBlock block, DateTime start
});


$StudyBlockCopyWith<$Res> get block;

}
/// @nodoc
class _$ScheduledOccurrenceCopyWithImpl<$Res>
    implements $ScheduledOccurrenceCopyWith<$Res> {
  _$ScheduledOccurrenceCopyWithImpl(this._self, this._then);

  final ScheduledOccurrence _self;
  final $Res Function(ScheduledOccurrence) _then;

/// Create a copy of ScheduledOccurrence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? block = null,Object? start = null,}) {
  return _then(ScheduledOccurrence(
block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as StudyBlock,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ScheduledOccurrence
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudyBlockCopyWith<$Res> get block {
  
  return $StudyBlockCopyWith<$Res>(_self.block, (value) {
    return _then(_self.copyWith(block: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScheduledOccurrence].
extension ScheduledOccurrencePatterns on ScheduledOccurrence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduledOccurrence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduledOccurrence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduledOccurrence value)  $default,){
final _that = this;
switch (_that) {
case _ScheduledOccurrence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduledOccurrence value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduledOccurrence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StudyBlock block,  DateTime start)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduledOccurrence() when $default != null:
return $default(_that.block,_that.start);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StudyBlock block,  DateTime start)  $default,) {final _that = this;
switch (_that) {
case _ScheduledOccurrence():
return $default(_that.block,_that.start);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StudyBlock block,  DateTime start)?  $default,) {final _that = this;
switch (_that) {
case _ScheduledOccurrence() when $default != null:
return $default(_that.block,_that.start);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduledOccurrence extends ScheduledOccurrence {
  const _ScheduledOccurrence({required this.block, required this.start}): super._();
  

@override final  StudyBlock block;
@override final  DateTime start;

/// Create a copy of ScheduledOccurrence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduledOccurrenceCopyWith<_ScheduledOccurrence> get copyWith => __$ScheduledOccurrenceCopyWithImpl<_ScheduledOccurrence>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduledOccurrence&&(identical(other.block, block) || other.block == block)&&(identical(other.start, start) || other.start == start));
}


@override
int get hashCode {
    return Object.hash(runtimeType,block,start);
}

@override
String toString() {
    return 'ScheduledOccurrence(block: $block, start: $start)';
}


}

/// @nodoc
abstract mixin class _$ScheduledOccurrenceCopyWith<$Res> implements $ScheduledOccurrenceCopyWith<$Res> {
  factory _$ScheduledOccurrenceCopyWith(_ScheduledOccurrence value, $Res Function(_ScheduledOccurrence) _then) = __$ScheduledOccurrenceCopyWithImpl;
@override @useResult
$Res call({
 StudyBlock block, DateTime start
});


@override $StudyBlockCopyWith<$Res> get block;

}
/// @nodoc
class __$ScheduledOccurrenceCopyWithImpl<$Res>
    implements _$ScheduledOccurrenceCopyWith<$Res> {
  __$ScheduledOccurrenceCopyWithImpl(this._self, this._then);

  final _ScheduledOccurrence _self;
  final $Res Function(_ScheduledOccurrence) _then;

/// Create a copy of ScheduledOccurrence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? block = null,Object? start = null,}) {
  return _then(_ScheduledOccurrence(
block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as StudyBlock,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ScheduledOccurrence
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudyBlockCopyWith<$Res> get block {
  
  return $StudyBlockCopyWith<$Res>(_self.block, (value) {
    return _then(_self.copyWith(block: value));
  });
}
}

// dart format on
