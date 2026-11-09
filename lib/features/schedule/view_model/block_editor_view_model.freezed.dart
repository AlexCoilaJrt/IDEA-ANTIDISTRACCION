// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_editor_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlockEditorState {

 StudyBlock get block;/// Los demás bloques, para detectar cruces.
 List<StudyBlock> get others; bool get saving;
/// Create a copy of BlockEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockEditorStateCopyWith<BlockEditorState> get copyWith => _$BlockEditorStateCopyWithImpl<BlockEditorState>(this as BlockEditorState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BlockEditorState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockEditorState&&(identical(other.block, _this.block) || other.block == _this.block)&&const DeepCollectionEquality().equals(other.others, _this.others)&&(identical(other.saving, _this.saving) || other.saving == _this.saving));
}


@override
int get hashCode {
  final _this = this as BlockEditorState;
  return Object.hash(runtimeType,_this.block,const DeepCollectionEquality().hash(_this.others),_this.saving);
}

@override
String toString() {
  final _this = this as BlockEditorState;
  return 'BlockEditorState(block: ${_this.block}, others: ${_this.others}, saving: ${_this.saving})';
}


}

/// @nodoc
abstract mixin class $BlockEditorStateCopyWith<$Res>  {
  factory $BlockEditorStateCopyWith(BlockEditorState value, $Res Function(BlockEditorState) _then) = _$BlockEditorStateCopyWithImpl;
@useResult
$Res call({
 StudyBlock block, List<StudyBlock> others, bool saving
});


$StudyBlockCopyWith<$Res> get block;

}
/// @nodoc
class _$BlockEditorStateCopyWithImpl<$Res>
    implements $BlockEditorStateCopyWith<$Res> {
  _$BlockEditorStateCopyWithImpl(this._self, this._then);

  final BlockEditorState _self;
  final $Res Function(BlockEditorState) _then;

/// Create a copy of BlockEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? block = null,Object? others = null,Object? saving = null,}) {
  return _then(BlockEditorState(
block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as StudyBlock,others: null == others ? _self.others : others // ignore: cast_nullable_to_non_nullable
as List<StudyBlock>,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of BlockEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudyBlockCopyWith<$Res> get block {
  
  return $StudyBlockCopyWith<$Res>(_self.block, (value) {
    return _then(_self.copyWith(block: value));
  });
}
}


/// Adds pattern-matching-related methods to [BlockEditorState].
extension BlockEditorStatePatterns on BlockEditorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockEditorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockEditorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockEditorState value)  $default,){
final _that = this;
switch (_that) {
case _BlockEditorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockEditorState value)?  $default,){
final _that = this;
switch (_that) {
case _BlockEditorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StudyBlock block,  List<StudyBlock> others,  bool saving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockEditorState() when $default != null:
return $default(_that.block,_that.others,_that.saving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StudyBlock block,  List<StudyBlock> others,  bool saving)  $default,) {final _that = this;
switch (_that) {
case _BlockEditorState():
return $default(_that.block,_that.others,_that.saving);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StudyBlock block,  List<StudyBlock> others,  bool saving)?  $default,) {final _that = this;
switch (_that) {
case _BlockEditorState() when $default != null:
return $default(_that.block,_that.others,_that.saving);case _:
  return null;

}
}

}

/// @nodoc


class _BlockEditorState extends BlockEditorState {
  const _BlockEditorState({required this.block, required  List<StudyBlock> others, this.saving = false}): _others = others,super._();
  

@override final  StudyBlock block;
/// Los demás bloques, para detectar cruces.
 final  List<StudyBlock> _others;
/// Los demás bloques, para detectar cruces.
@override List<StudyBlock> get others {
  if (_others is EqualUnmodifiableListView) return _others;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_others);
}

@override@JsonKey() final  bool saving;

/// Create a copy of BlockEditorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockEditorStateCopyWith<_BlockEditorState> get copyWith => __$BlockEditorStateCopyWithImpl<_BlockEditorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockEditorState&&(identical(other.block, block) || other.block == block)&&const DeepCollectionEquality().equals(other.others, _others)&&(identical(other.saving, saving) || other.saving == saving));
}


@override
int get hashCode {
    return Object.hash(runtimeType,block,const DeepCollectionEquality().hash(_others),saving);
}

@override
String toString() {
    return 'BlockEditorState(block: $block, others: $others, saving: $saving)';
}


}

/// @nodoc
abstract mixin class _$BlockEditorStateCopyWith<$Res> implements $BlockEditorStateCopyWith<$Res> {
  factory _$BlockEditorStateCopyWith(_BlockEditorState value, $Res Function(_BlockEditorState) _then) = __$BlockEditorStateCopyWithImpl;
@override @useResult
$Res call({
 StudyBlock block, List<StudyBlock> others, bool saving
});


@override $StudyBlockCopyWith<$Res> get block;

}
/// @nodoc
class __$BlockEditorStateCopyWithImpl<$Res>
    implements _$BlockEditorStateCopyWith<$Res> {
  __$BlockEditorStateCopyWithImpl(this._self, this._then);

  final _BlockEditorState _self;
  final $Res Function(_BlockEditorState) _then;

/// Create a copy of BlockEditorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? block = null,Object? others = null,Object? saving = null,}) {
  return _then(_BlockEditorState(
block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as StudyBlock,others: null == others ? _self._others : others // ignore: cast_nullable_to_non_nullable
as List<StudyBlock>,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of BlockEditorState
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
