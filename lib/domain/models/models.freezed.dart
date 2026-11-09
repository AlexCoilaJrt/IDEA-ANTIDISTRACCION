// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InstalledApp {

 String get packageName; String get label; Uint8List? get icon;
/// Create a copy of InstalledApp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstalledAppCopyWith<InstalledApp> get copyWith => _$InstalledAppCopyWithImpl<InstalledApp>(this as InstalledApp, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InstalledApp;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstalledApp&&(identical(other.packageName, _this.packageName) || other.packageName == _this.packageName)&&(identical(other.label, _this.label) || other.label == _this.label)&&const DeepCollectionEquality().equals(other.icon, _this.icon));
}


@override
int get hashCode {
  final _this = this as InstalledApp;
  return Object.hash(runtimeType,_this.packageName,_this.label,const DeepCollectionEquality().hash(_this.icon));
}

@override
String toString() {
  final _this = this as InstalledApp;
  return 'InstalledApp(packageName: ${_this.packageName}, label: ${_this.label}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $InstalledAppCopyWith<$Res>  {
  factory $InstalledAppCopyWith(InstalledApp value, $Res Function(InstalledApp) _then) = _$InstalledAppCopyWithImpl;
@useResult
$Res call({
 String packageName, String label, Uint8List? icon
});




}
/// @nodoc
class _$InstalledAppCopyWithImpl<$Res>
    implements $InstalledAppCopyWith<$Res> {
  _$InstalledAppCopyWithImpl(this._self, this._then);

  final InstalledApp _self;
  final $Res Function(InstalledApp) _then;

/// Create a copy of InstalledApp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? label = null,Object? icon = freezed,}) {
  return _then(InstalledApp(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [InstalledApp].
extension InstalledAppPatterns on InstalledApp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstalledApp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstalledApp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstalledApp value)  $default,){
final _that = this;
switch (_that) {
case _InstalledApp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstalledApp value)?  $default,){
final _that = this;
switch (_that) {
case _InstalledApp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String label,  Uint8List? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstalledApp() when $default != null:
return $default(_that.packageName,_that.label,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String label,  Uint8List? icon)  $default,) {final _that = this;
switch (_that) {
case _InstalledApp():
return $default(_that.packageName,_that.label,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String label,  Uint8List? icon)?  $default,) {final _that = this;
switch (_that) {
case _InstalledApp() when $default != null:
return $default(_that.packageName,_that.label,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _InstalledApp implements InstalledApp {
  const _InstalledApp({required this.packageName, required this.label, this.icon});
  

@override final  String packageName;
@override final  String label;
@override final  Uint8List? icon;

/// Create a copy of InstalledApp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstalledAppCopyWith<_InstalledApp> get copyWith => __$InstalledAppCopyWithImpl<_InstalledApp>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstalledApp&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.icon, icon));
}


@override
int get hashCode {
    return Object.hash(runtimeType,packageName,label,const DeepCollectionEquality().hash(icon));
}

@override
String toString() {
    return 'InstalledApp(packageName: $packageName, label: $label, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$InstalledAppCopyWith<$Res> implements $InstalledAppCopyWith<$Res> {
  factory _$InstalledAppCopyWith(_InstalledApp value, $Res Function(_InstalledApp) _then) = __$InstalledAppCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String label, Uint8List? icon
});




}
/// @nodoc
class __$InstalledAppCopyWithImpl<$Res>
    implements _$InstalledAppCopyWith<$Res> {
  __$InstalledAppCopyWithImpl(this._self, this._then);

  final _InstalledApp _self;
  final $Res Function(_InstalledApp) _then;

/// Create a copy of InstalledApp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? label = null,Object? icon = freezed,}) {
  return _then(_InstalledApp(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc
mixin _$AllowedApp {

 String get packageName; String get label;
/// Create a copy of AllowedApp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllowedAppCopyWith<AllowedApp> get copyWith => _$AllowedAppCopyWithImpl<AllowedApp>(this as AllowedApp, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AllowedApp;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllowedApp&&(identical(other.packageName, _this.packageName) || other.packageName == _this.packageName)&&(identical(other.label, _this.label) || other.label == _this.label));
}


@override
int get hashCode {
  final _this = this as AllowedApp;
  return Object.hash(runtimeType,_this.packageName,_this.label);
}

@override
String toString() {
  final _this = this as AllowedApp;
  return 'AllowedApp(packageName: ${_this.packageName}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $AllowedAppCopyWith<$Res>  {
  factory $AllowedAppCopyWith(AllowedApp value, $Res Function(AllowedApp) _then) = _$AllowedAppCopyWithImpl;
@useResult
$Res call({
 String packageName, String label
});




}
/// @nodoc
class _$AllowedAppCopyWithImpl<$Res>
    implements $AllowedAppCopyWith<$Res> {
  _$AllowedAppCopyWithImpl(this._self, this._then);

  final AllowedApp _self;
  final $Res Function(AllowedApp) _then;

/// Create a copy of AllowedApp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? label = null,}) {
  return _then(AllowedApp(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AllowedApp].
extension AllowedAppPatterns on AllowedApp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllowedApp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllowedApp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllowedApp value)  $default,){
final _that = this;
switch (_that) {
case _AllowedApp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllowedApp value)?  $default,){
final _that = this;
switch (_that) {
case _AllowedApp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllowedApp() when $default != null:
return $default(_that.packageName,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String label)  $default,) {final _that = this;
switch (_that) {
case _AllowedApp():
return $default(_that.packageName,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String label)?  $default,) {final _that = this;
switch (_that) {
case _AllowedApp() when $default != null:
return $default(_that.packageName,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _AllowedApp implements AllowedApp {
  const _AllowedApp({required this.packageName, required this.label});
  

@override final  String packageName;
@override final  String label;

/// Create a copy of AllowedApp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllowedAppCopyWith<_AllowedApp> get copyWith => __$AllowedAppCopyWithImpl<_AllowedApp>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllowedApp&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode {
    return Object.hash(runtimeType,packageName,label);
}

@override
String toString() {
    return 'AllowedApp(packageName: $packageName, label: $label)';
}


}

/// @nodoc
abstract mixin class _$AllowedAppCopyWith<$Res> implements $AllowedAppCopyWith<$Res> {
  factory _$AllowedAppCopyWith(_AllowedApp value, $Res Function(_AllowedApp) _then) = __$AllowedAppCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String label
});




}
/// @nodoc
class __$AllowedAppCopyWithImpl<$Res>
    implements _$AllowedAppCopyWith<$Res> {
  __$AllowedAppCopyWithImpl(this._self, this._then);

  final _AllowedApp _self;
  final $Res Function(_AllowedApp) _then;

/// Create a copy of AllowedApp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? label = null,}) {
  return _then(_AllowedApp(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DistractionEvent {

 String get packageName; DateTime get at;
/// Create a copy of DistractionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistractionEventCopyWith<DistractionEvent> get copyWith => _$DistractionEventCopyWithImpl<DistractionEvent>(this as DistractionEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DistractionEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistractionEvent&&(identical(other.packageName, _this.packageName) || other.packageName == _this.packageName)&&(identical(other.at, _this.at) || other.at == _this.at));
}


@override
int get hashCode {
  final _this = this as DistractionEvent;
  return Object.hash(runtimeType,_this.packageName,_this.at);
}

@override
String toString() {
  final _this = this as DistractionEvent;
  return 'DistractionEvent(packageName: ${_this.packageName}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $DistractionEventCopyWith<$Res>  {
  factory $DistractionEventCopyWith(DistractionEvent value, $Res Function(DistractionEvent) _then) = _$DistractionEventCopyWithImpl;
@useResult
$Res call({
 String packageName, DateTime at
});




}
/// @nodoc
class _$DistractionEventCopyWithImpl<$Res>
    implements $DistractionEventCopyWith<$Res> {
  _$DistractionEventCopyWithImpl(this._self, this._then);

  final DistractionEvent _self;
  final $Res Function(DistractionEvent) _then;

/// Create a copy of DistractionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? at = null,}) {
  return _then(DistractionEvent(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DistractionEvent].
extension DistractionEventPatterns on DistractionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistractionEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistractionEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistractionEvent value)  $default,){
final _that = this;
switch (_that) {
case _DistractionEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistractionEvent value)?  $default,){
final _that = this;
switch (_that) {
case _DistractionEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistractionEvent() when $default != null:
return $default(_that.packageName,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _DistractionEvent():
return $default(_that.packageName,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _DistractionEvent() when $default != null:
return $default(_that.packageName,_that.at);case _:
  return null;

}
}

}

/// @nodoc


class _DistractionEvent implements DistractionEvent {
  const _DistractionEvent({required this.packageName, required this.at});
  

@override final  String packageName;
@override final  DateTime at;

/// Create a copy of DistractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistractionEventCopyWith<_DistractionEvent> get copyWith => __$DistractionEventCopyWithImpl<_DistractionEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistractionEvent&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode {
    return Object.hash(runtimeType,packageName,at);
}

@override
String toString() {
    return 'DistractionEvent(packageName: $packageName, at: $at)';
}


}

/// @nodoc
abstract mixin class _$DistractionEventCopyWith<$Res> implements $DistractionEventCopyWith<$Res> {
  factory _$DistractionEventCopyWith(_DistractionEvent value, $Res Function(_DistractionEvent) _then) = __$DistractionEventCopyWithImpl;
@override @useResult
$Res call({
 String packageName, DateTime at
});




}
/// @nodoc
class __$DistractionEventCopyWithImpl<$Res>
    implements _$DistractionEventCopyWith<$Res> {
  __$DistractionEventCopyWithImpl(this._self, this._then);

  final _DistractionEvent _self;
  final $Res Function(_DistractionEvent) _then;

/// Create a copy of DistractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? at = null,}) {
  return _then(_DistractionEvent(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$AppPermissions {

 bool get usageAccess; bool get overlay; bool get notifications; bool get batteryOptimization;
/// Create a copy of AppPermissions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppPermissionsCopyWith<AppPermissions> get copyWith => _$AppPermissionsCopyWithImpl<AppPermissions>(this as AppPermissions, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppPermissions;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppPermissions&&(identical(other.usageAccess, _this.usageAccess) || other.usageAccess == _this.usageAccess)&&(identical(other.overlay, _this.overlay) || other.overlay == _this.overlay)&&(identical(other.notifications, _this.notifications) || other.notifications == _this.notifications)&&(identical(other.batteryOptimization, _this.batteryOptimization) || other.batteryOptimization == _this.batteryOptimization));
}


@override
int get hashCode {
  final _this = this as AppPermissions;
  return Object.hash(runtimeType,_this.usageAccess,_this.overlay,_this.notifications,_this.batteryOptimization);
}

@override
String toString() {
  final _this = this as AppPermissions;
  return 'AppPermissions(usageAccess: ${_this.usageAccess}, overlay: ${_this.overlay}, notifications: ${_this.notifications}, batteryOptimization: ${_this.batteryOptimization})';
}


}

/// @nodoc
abstract mixin class $AppPermissionsCopyWith<$Res>  {
  factory $AppPermissionsCopyWith(AppPermissions value, $Res Function(AppPermissions) _then) = _$AppPermissionsCopyWithImpl;
@useResult
$Res call({
 bool usageAccess, bool overlay, bool notifications, bool batteryOptimization
});




}
/// @nodoc
class _$AppPermissionsCopyWithImpl<$Res>
    implements $AppPermissionsCopyWith<$Res> {
  _$AppPermissionsCopyWithImpl(this._self, this._then);

  final AppPermissions _self;
  final $Res Function(AppPermissions) _then;

/// Create a copy of AppPermissions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usageAccess = null,Object? overlay = null,Object? notifications = null,Object? batteryOptimization = null,}) {
  return _then(AppPermissions(
usageAccess: null == usageAccess ? _self.usageAccess : usageAccess // ignore: cast_nullable_to_non_nullable
as bool,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as bool,batteryOptimization: null == batteryOptimization ? _self.batteryOptimization : batteryOptimization // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppPermissions].
extension AppPermissionsPatterns on AppPermissions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppPermissions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppPermissions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppPermissions value)  $default,){
final _that = this;
switch (_that) {
case _AppPermissions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppPermissions value)?  $default,){
final _that = this;
switch (_that) {
case _AppPermissions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool usageAccess,  bool overlay,  bool notifications,  bool batteryOptimization)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppPermissions() when $default != null:
return $default(_that.usageAccess,_that.overlay,_that.notifications,_that.batteryOptimization);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool usageAccess,  bool overlay,  bool notifications,  bool batteryOptimization)  $default,) {final _that = this;
switch (_that) {
case _AppPermissions():
return $default(_that.usageAccess,_that.overlay,_that.notifications,_that.batteryOptimization);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool usageAccess,  bool overlay,  bool notifications,  bool batteryOptimization)?  $default,) {final _that = this;
switch (_that) {
case _AppPermissions() when $default != null:
return $default(_that.usageAccess,_that.overlay,_that.notifications,_that.batteryOptimization);case _:
  return null;

}
}

}

/// @nodoc


class _AppPermissions extends AppPermissions {
  const _AppPermissions({required this.usageAccess, required this.overlay, required this.notifications, required this.batteryOptimization}): super._();
  

@override final  bool usageAccess;
@override final  bool overlay;
@override final  bool notifications;
@override final  bool batteryOptimization;

/// Create a copy of AppPermissions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppPermissionsCopyWith<_AppPermissions> get copyWith => __$AppPermissionsCopyWithImpl<_AppPermissions>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppPermissions&&(identical(other.usageAccess, usageAccess) || other.usageAccess == usageAccess)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.batteryOptimization, batteryOptimization) || other.batteryOptimization == batteryOptimization));
}


@override
int get hashCode {
    return Object.hash(runtimeType,usageAccess,overlay,notifications,batteryOptimization);
}

@override
String toString() {
    return 'AppPermissions(usageAccess: $usageAccess, overlay: $overlay, notifications: $notifications, batteryOptimization: $batteryOptimization)';
}


}

/// @nodoc
abstract mixin class _$AppPermissionsCopyWith<$Res> implements $AppPermissionsCopyWith<$Res> {
  factory _$AppPermissionsCopyWith(_AppPermissions value, $Res Function(_AppPermissions) _then) = __$AppPermissionsCopyWithImpl;
@override @useResult
$Res call({
 bool usageAccess, bool overlay, bool notifications, bool batteryOptimization
});




}
/// @nodoc
class __$AppPermissionsCopyWithImpl<$Res>
    implements _$AppPermissionsCopyWith<$Res> {
  __$AppPermissionsCopyWithImpl(this._self, this._then);

  final _AppPermissions _self;
  final $Res Function(_AppPermissions) _then;

/// Create a copy of AppPermissions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usageAccess = null,Object? overlay = null,Object? notifications = null,Object? batteryOptimization = null,}) {
  return _then(_AppPermissions(
usageAccess: null == usageAccess ? _self.usageAccess : usageAccess // ignore: cast_nullable_to_non_nullable
as bool,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as bool,batteryOptimization: null == batteryOptimization ? _self.batteryOptimization : batteryOptimization // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$AppSettings {

 int get dailyGoalMinutes; PomodoroPreset get preset; int get freeMinutes; int get cycles; Strictness get strictness; AppThemeMode get themeMode; bool get onboardingDone;/// Si ya se preseleccionaron las apps sugeridas (calculadora, PDF...).
 bool get allowlistSeeded;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.dailyGoalMinutes, _this.dailyGoalMinutes) || other.dailyGoalMinutes == _this.dailyGoalMinutes)&&(identical(other.preset, _this.preset) || other.preset == _this.preset)&&(identical(other.freeMinutes, _this.freeMinutes) || other.freeMinutes == _this.freeMinutes)&&(identical(other.cycles, _this.cycles) || other.cycles == _this.cycles)&&(identical(other.strictness, _this.strictness) || other.strictness == _this.strictness)&&(identical(other.themeMode, _this.themeMode) || other.themeMode == _this.themeMode)&&(identical(other.onboardingDone, _this.onboardingDone) || other.onboardingDone == _this.onboardingDone)&&(identical(other.allowlistSeeded, _this.allowlistSeeded) || other.allowlistSeeded == _this.allowlistSeeded));
}


@override
int get hashCode {
  final _this = this as AppSettings;
  return Object.hash(runtimeType,_this.dailyGoalMinutes,_this.preset,_this.freeMinutes,_this.cycles,_this.strictness,_this.themeMode,_this.onboardingDone,_this.allowlistSeeded);
}

@override
String toString() {
  final _this = this as AppSettings;
  return 'AppSettings(dailyGoalMinutes: ${_this.dailyGoalMinutes}, preset: ${_this.preset}, freeMinutes: ${_this.freeMinutes}, cycles: ${_this.cycles}, strictness: ${_this.strictness}, themeMode: ${_this.themeMode}, onboardingDone: ${_this.onboardingDone}, allowlistSeeded: ${_this.allowlistSeeded})';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 int dailyGoalMinutes, PomodoroPreset preset, int freeMinutes, int cycles, Strictness strictness, AppThemeMode themeMode, bool onboardingDone, bool allowlistSeeded
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyGoalMinutes = null,Object? preset = null,Object? freeMinutes = null,Object? cycles = null,Object? strictness = null,Object? themeMode = null,Object? onboardingDone = null,Object? allowlistSeeded = null,}) {
  return _then(AppSettings(
dailyGoalMinutes: null == dailyGoalMinutes ? _self.dailyGoalMinutes : dailyGoalMinutes // ignore: cast_nullable_to_non_nullable
as int,preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PomodoroPreset,freeMinutes: null == freeMinutes ? _self.freeMinutes : freeMinutes // ignore: cast_nullable_to_non_nullable
as int,cycles: null == cycles ? _self.cycles : cycles // ignore: cast_nullable_to_non_nullable
as int,strictness: null == strictness ? _self.strictness : strictness // ignore: cast_nullable_to_non_nullable
as Strictness,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,onboardingDone: null == onboardingDone ? _self.onboardingDone : onboardingDone // ignore: cast_nullable_to_non_nullable
as bool,allowlistSeeded: null == allowlistSeeded ? _self.allowlistSeeded : allowlistSeeded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dailyGoalMinutes,  PomodoroPreset preset,  int freeMinutes,  int cycles,  Strictness strictness,  AppThemeMode themeMode,  bool onboardingDone,  bool allowlistSeeded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.dailyGoalMinutes,_that.preset,_that.freeMinutes,_that.cycles,_that.strictness,_that.themeMode,_that.onboardingDone,_that.allowlistSeeded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dailyGoalMinutes,  PomodoroPreset preset,  int freeMinutes,  int cycles,  Strictness strictness,  AppThemeMode themeMode,  bool onboardingDone,  bool allowlistSeeded)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.dailyGoalMinutes,_that.preset,_that.freeMinutes,_that.cycles,_that.strictness,_that.themeMode,_that.onboardingDone,_that.allowlistSeeded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dailyGoalMinutes,  PomodoroPreset preset,  int freeMinutes,  int cycles,  Strictness strictness,  AppThemeMode themeMode,  bool onboardingDone,  bool allowlistSeeded)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.dailyGoalMinutes,_that.preset,_that.freeMinutes,_that.cycles,_that.strictness,_that.themeMode,_that.onboardingDone,_that.allowlistSeeded);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettings extends AppSettings {
  const _AppSettings({this.dailyGoalMinutes = 25, this.preset = PomodoroPreset.classic, this.freeMinutes = 45, this.cycles = 1, this.strictness = Strictness.standard, this.themeMode = AppThemeMode.dark, this.onboardingDone = false, this.allowlistSeeded = false}): super._();
  

@override@JsonKey() final  int dailyGoalMinutes;
@override@JsonKey() final  PomodoroPreset preset;
@override@JsonKey() final  int freeMinutes;
@override@JsonKey() final  int cycles;
@override@JsonKey() final  Strictness strictness;
@override@JsonKey() final  AppThemeMode themeMode;
@override@JsonKey() final  bool onboardingDone;
/// Si ya se preseleccionaron las apps sugeridas (calculadora, PDF...).
@override@JsonKey() final  bool allowlistSeeded;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.dailyGoalMinutes, dailyGoalMinutes) || other.dailyGoalMinutes == dailyGoalMinutes)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.freeMinutes, freeMinutes) || other.freeMinutes == freeMinutes)&&(identical(other.cycles, cycles) || other.cycles == cycles)&&(identical(other.strictness, strictness) || other.strictness == strictness)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.onboardingDone, onboardingDone) || other.onboardingDone == onboardingDone)&&(identical(other.allowlistSeeded, allowlistSeeded) || other.allowlistSeeded == allowlistSeeded));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dailyGoalMinutes,preset,freeMinutes,cycles,strictness,themeMode,onboardingDone,allowlistSeeded);
}

@override
String toString() {
    return 'AppSettings(dailyGoalMinutes: $dailyGoalMinutes, preset: $preset, freeMinutes: $freeMinutes, cycles: $cycles, strictness: $strictness, themeMode: $themeMode, onboardingDone: $onboardingDone, allowlistSeeded: $allowlistSeeded)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 int dailyGoalMinutes, PomodoroPreset preset, int freeMinutes, int cycles, Strictness strictness, AppThemeMode themeMode, bool onboardingDone, bool allowlistSeeded
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyGoalMinutes = null,Object? preset = null,Object? freeMinutes = null,Object? cycles = null,Object? strictness = null,Object? themeMode = null,Object? onboardingDone = null,Object? allowlistSeeded = null,}) {
  return _then(_AppSettings(
dailyGoalMinutes: null == dailyGoalMinutes ? _self.dailyGoalMinutes : dailyGoalMinutes // ignore: cast_nullable_to_non_nullable
as int,preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PomodoroPreset,freeMinutes: null == freeMinutes ? _self.freeMinutes : freeMinutes // ignore: cast_nullable_to_non_nullable
as int,cycles: null == cycles ? _self.cycles : cycles // ignore: cast_nullable_to_non_nullable
as int,strictness: null == strictness ? _self.strictness : strictness // ignore: cast_nullable_to_non_nullable
as Strictness,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,onboardingDone: null == onboardingDone ? _self.onboardingDone : onboardingDone // ignore: cast_nullable_to_non_nullable
as bool,allowlistSeeded: null == allowlistSeeded ? _self.allowlistSeeded : allowlistSeeded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$DayFocus {

/// Medianoche local del día.
 DateTime get day; int get focusedMinutes; bool get hadEarlyExit;
/// Create a copy of DayFocus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayFocusCopyWith<DayFocus> get copyWith => _$DayFocusCopyWithImpl<DayFocus>(this as DayFocus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayFocus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayFocus&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.focusedMinutes, _this.focusedMinutes) || other.focusedMinutes == _this.focusedMinutes)&&(identical(other.hadEarlyExit, _this.hadEarlyExit) || other.hadEarlyExit == _this.hadEarlyExit));
}


@override
int get hashCode {
  final _this = this as DayFocus;
  return Object.hash(runtimeType,_this.day,_this.focusedMinutes,_this.hadEarlyExit);
}

@override
String toString() {
  final _this = this as DayFocus;
  return 'DayFocus(day: ${_this.day}, focusedMinutes: ${_this.focusedMinutes}, hadEarlyExit: ${_this.hadEarlyExit})';
}


}

/// @nodoc
abstract mixin class $DayFocusCopyWith<$Res>  {
  factory $DayFocusCopyWith(DayFocus value, $Res Function(DayFocus) _then) = _$DayFocusCopyWithImpl;
@useResult
$Res call({
 DateTime day, int focusedMinutes, bool hadEarlyExit
});




}
/// @nodoc
class _$DayFocusCopyWithImpl<$Res>
    implements $DayFocusCopyWith<$Res> {
  _$DayFocusCopyWithImpl(this._self, this._then);

  final DayFocus _self;
  final $Res Function(DayFocus) _then;

/// Create a copy of DayFocus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? focusedMinutes = null,Object? hadEarlyExit = null,}) {
  return _then(DayFocus(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,focusedMinutes: null == focusedMinutes ? _self.focusedMinutes : focusedMinutes // ignore: cast_nullable_to_non_nullable
as int,hadEarlyExit: null == hadEarlyExit ? _self.hadEarlyExit : hadEarlyExit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DayFocus].
extension DayFocusPatterns on DayFocus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayFocus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayFocus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayFocus value)  $default,){
final _that = this;
switch (_that) {
case _DayFocus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayFocus value)?  $default,){
final _that = this;
switch (_that) {
case _DayFocus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime day,  int focusedMinutes,  bool hadEarlyExit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayFocus() when $default != null:
return $default(_that.day,_that.focusedMinutes,_that.hadEarlyExit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime day,  int focusedMinutes,  bool hadEarlyExit)  $default,) {final _that = this;
switch (_that) {
case _DayFocus():
return $default(_that.day,_that.focusedMinutes,_that.hadEarlyExit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime day,  int focusedMinutes,  bool hadEarlyExit)?  $default,) {final _that = this;
switch (_that) {
case _DayFocus() when $default != null:
return $default(_that.day,_that.focusedMinutes,_that.hadEarlyExit);case _:
  return null;

}
}

}

/// @nodoc


class _DayFocus implements DayFocus {
  const _DayFocus({required this.day, required this.focusedMinutes, required this.hadEarlyExit});
  

/// Medianoche local del día.
@override final  DateTime day;
@override final  int focusedMinutes;
@override final  bool hadEarlyExit;

/// Create a copy of DayFocus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayFocusCopyWith<_DayFocus> get copyWith => __$DayFocusCopyWithImpl<_DayFocus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayFocus&&(identical(other.day, day) || other.day == day)&&(identical(other.focusedMinutes, focusedMinutes) || other.focusedMinutes == focusedMinutes)&&(identical(other.hadEarlyExit, hadEarlyExit) || other.hadEarlyExit == hadEarlyExit));
}


@override
int get hashCode {
    return Object.hash(runtimeType,day,focusedMinutes,hadEarlyExit);
}

@override
String toString() {
    return 'DayFocus(day: $day, focusedMinutes: $focusedMinutes, hadEarlyExit: $hadEarlyExit)';
}


}

/// @nodoc
abstract mixin class _$DayFocusCopyWith<$Res> implements $DayFocusCopyWith<$Res> {
  factory _$DayFocusCopyWith(_DayFocus value, $Res Function(_DayFocus) _then) = __$DayFocusCopyWithImpl;
@override @useResult
$Res call({
 DateTime day, int focusedMinutes, bool hadEarlyExit
});




}
/// @nodoc
class __$DayFocusCopyWithImpl<$Res>
    implements _$DayFocusCopyWith<$Res> {
  __$DayFocusCopyWithImpl(this._self, this._then);

  final _DayFocus _self;
  final $Res Function(_DayFocus) _then;

/// Create a copy of DayFocus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? focusedMinutes = null,Object? hadEarlyExit = null,}) {
  return _then(_DayFocus(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,focusedMinutes: null == focusedMinutes ? _self.focusedMinutes : focusedMinutes // ignore: cast_nullable_to_non_nullable
as int,hadEarlyExit: null == hadEarlyExit ? _self.hadEarlyExit : hadEarlyExit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$StreakSummary {

 int get current; int get best; bool get todayQualified;
/// Create a copy of StreakSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreakSummaryCopyWith<StreakSummary> get copyWith => _$StreakSummaryCopyWithImpl<StreakSummary>(this as StreakSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StreakSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreakSummary&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.best, _this.best) || other.best == _this.best)&&(identical(other.todayQualified, _this.todayQualified) || other.todayQualified == _this.todayQualified));
}


@override
int get hashCode {
  final _this = this as StreakSummary;
  return Object.hash(runtimeType,_this.current,_this.best,_this.todayQualified);
}

@override
String toString() {
  final _this = this as StreakSummary;
  return 'StreakSummary(current: ${_this.current}, best: ${_this.best}, todayQualified: ${_this.todayQualified})';
}


}

/// @nodoc
abstract mixin class $StreakSummaryCopyWith<$Res>  {
  factory $StreakSummaryCopyWith(StreakSummary value, $Res Function(StreakSummary) _then) = _$StreakSummaryCopyWithImpl;
@useResult
$Res call({
 int current, int best, bool todayQualified
});




}
/// @nodoc
class _$StreakSummaryCopyWithImpl<$Res>
    implements $StreakSummaryCopyWith<$Res> {
  _$StreakSummaryCopyWithImpl(this._self, this._then);

  final StreakSummary _self;
  final $Res Function(StreakSummary) _then;

/// Create a copy of StreakSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? best = null,Object? todayQualified = null,}) {
  return _then(StreakSummary(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,best: null == best ? _self.best : best // ignore: cast_nullable_to_non_nullable
as int,todayQualified: null == todayQualified ? _self.todayQualified : todayQualified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StreakSummary].
extension StreakSummaryPatterns on StreakSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreakSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreakSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreakSummary value)  $default,){
final _that = this;
switch (_that) {
case _StreakSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreakSummary value)?  $default,){
final _that = this;
switch (_that) {
case _StreakSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current,  int best,  bool todayQualified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreakSummary() when $default != null:
return $default(_that.current,_that.best,_that.todayQualified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current,  int best,  bool todayQualified)  $default,) {final _that = this;
switch (_that) {
case _StreakSummary():
return $default(_that.current,_that.best,_that.todayQualified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current,  int best,  bool todayQualified)?  $default,) {final _that = this;
switch (_that) {
case _StreakSummary() when $default != null:
return $default(_that.current,_that.best,_that.todayQualified);case _:
  return null;

}
}

}

/// @nodoc


class _StreakSummary implements StreakSummary {
  const _StreakSummary({required this.current, required this.best, required this.todayQualified});
  

@override final  int current;
@override final  int best;
@override final  bool todayQualified;

/// Create a copy of StreakSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreakSummaryCopyWith<_StreakSummary> get copyWith => __$StreakSummaryCopyWithImpl<_StreakSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreakSummary&&(identical(other.current, current) || other.current == current)&&(identical(other.best, best) || other.best == best)&&(identical(other.todayQualified, todayQualified) || other.todayQualified == todayQualified));
}


@override
int get hashCode {
    return Object.hash(runtimeType,current,best,todayQualified);
}

@override
String toString() {
    return 'StreakSummary(current: $current, best: $best, todayQualified: $todayQualified)';
}


}

/// @nodoc
abstract mixin class _$StreakSummaryCopyWith<$Res> implements $StreakSummaryCopyWith<$Res> {
  factory _$StreakSummaryCopyWith(_StreakSummary value, $Res Function(_StreakSummary) _then) = __$StreakSummaryCopyWithImpl;
@override @useResult
$Res call({
 int current, int best, bool todayQualified
});




}
/// @nodoc
class __$StreakSummaryCopyWithImpl<$Res>
    implements _$StreakSummaryCopyWith<$Res> {
  __$StreakSummaryCopyWithImpl(this._self, this._then);

  final _StreakSummary _self;
  final $Res Function(_StreakSummary) _then;

/// Create a copy of StreakSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? best = null,Object? todayQualified = null,}) {
  return _then(_StreakSummary(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,best: null == best ? _self.best : best // ignore: cast_nullable_to_non_nullable
as int,todayQualified: null == todayQualified ? _self.todayQualified : todayQualified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$BlockerStatus {

 bool get active; List<DistractionEvent> get distractions; int? get sessionId; DateTime? get endsAt;
/// Create a copy of BlockerStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockerStatusCopyWith<BlockerStatus> get copyWith => _$BlockerStatusCopyWithImpl<BlockerStatus>(this as BlockerStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BlockerStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockerStatus&&(identical(other.active, _this.active) || other.active == _this.active)&&const DeepCollectionEquality().equals(other.distractions, _this.distractions)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt));
}


@override
int get hashCode {
  final _this = this as BlockerStatus;
  return Object.hash(runtimeType,_this.active,const DeepCollectionEquality().hash(_this.distractions),_this.sessionId,_this.endsAt);
}

@override
String toString() {
  final _this = this as BlockerStatus;
  return 'BlockerStatus(active: ${_this.active}, distractions: ${_this.distractions}, sessionId: ${_this.sessionId}, endsAt: ${_this.endsAt})';
}


}

/// @nodoc
abstract mixin class $BlockerStatusCopyWith<$Res>  {
  factory $BlockerStatusCopyWith(BlockerStatus value, $Res Function(BlockerStatus) _then) = _$BlockerStatusCopyWithImpl;
@useResult
$Res call({
 bool active, List<DistractionEvent> distractions, int? sessionId, DateTime? endsAt
});




}
/// @nodoc
class _$BlockerStatusCopyWithImpl<$Res>
    implements $BlockerStatusCopyWith<$Res> {
  _$BlockerStatusCopyWithImpl(this._self, this._then);

  final BlockerStatus _self;
  final $Res Function(BlockerStatus) _then;

/// Create a copy of BlockerStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,Object? distractions = null,Object? sessionId = freezed,Object? endsAt = freezed,}) {
  return _then(BlockerStatus(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,distractions: null == distractions ? _self.distractions : distractions // ignore: cast_nullable_to_non_nullable
as List<DistractionEvent>,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockerStatus].
extension BlockerStatusPatterns on BlockerStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockerStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockerStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockerStatus value)  $default,){
final _that = this;
switch (_that) {
case _BlockerStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockerStatus value)?  $default,){
final _that = this;
switch (_that) {
case _BlockerStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool active,  List<DistractionEvent> distractions,  int? sessionId,  DateTime? endsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockerStatus() when $default != null:
return $default(_that.active,_that.distractions,_that.sessionId,_that.endsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool active,  List<DistractionEvent> distractions,  int? sessionId,  DateTime? endsAt)  $default,) {final _that = this;
switch (_that) {
case _BlockerStatus():
return $default(_that.active,_that.distractions,_that.sessionId,_that.endsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool active,  List<DistractionEvent> distractions,  int? sessionId,  DateTime? endsAt)?  $default,) {final _that = this;
switch (_that) {
case _BlockerStatus() when $default != null:
return $default(_that.active,_that.distractions,_that.sessionId,_that.endsAt);case _:
  return null;

}
}

}

/// @nodoc


class _BlockerStatus implements BlockerStatus {
  const _BlockerStatus({required this.active, required  List<DistractionEvent> distractions, this.sessionId, this.endsAt}): _distractions = distractions;
  

@override final  bool active;
 final  List<DistractionEvent> _distractions;
@override List<DistractionEvent> get distractions {
  if (_distractions is EqualUnmodifiableListView) return _distractions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_distractions);
}

@override final  int? sessionId;
@override final  DateTime? endsAt;

/// Create a copy of BlockerStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockerStatusCopyWith<_BlockerStatus> get copyWith => __$BlockerStatusCopyWithImpl<_BlockerStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockerStatus&&(identical(other.active, active) || other.active == active)&&const DeepCollectionEquality().equals(other.distractions, _distractions)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,active,const DeepCollectionEquality().hash(_distractions),sessionId,endsAt);
}

@override
String toString() {
    return 'BlockerStatus(active: $active, distractions: $distractions, sessionId: $sessionId, endsAt: $endsAt)';
}


}

/// @nodoc
abstract mixin class _$BlockerStatusCopyWith<$Res> implements $BlockerStatusCopyWith<$Res> {
  factory _$BlockerStatusCopyWith(_BlockerStatus value, $Res Function(_BlockerStatus) _then) = __$BlockerStatusCopyWithImpl;
@override @useResult
$Res call({
 bool active, List<DistractionEvent> distractions, int? sessionId, DateTime? endsAt
});




}
/// @nodoc
class __$BlockerStatusCopyWithImpl<$Res>
    implements _$BlockerStatusCopyWith<$Res> {
  __$BlockerStatusCopyWithImpl(this._self, this._then);

  final _BlockerStatus _self;
  final $Res Function(_BlockerStatus) _then;

/// Create a copy of BlockerStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,Object? distractions = null,Object? sessionId = freezed,Object? endsAt = freezed,}) {
  return _then(_BlockerStatus(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,distractions: null == distractions ? _self._distractions : distractions // ignore: cast_nullable_to_non_nullable
as List<DistractionEvent>,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$BlockerConfig {

 int get sessionId; DateTime get startedAt; PomodoroPlan get plan; List<String> get allowedPackages; Strictness get strictness;
/// Create a copy of BlockerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockerConfigCopyWith<BlockerConfig> get copyWith => _$BlockerConfigCopyWithImpl<BlockerConfig>(this as BlockerConfig, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BlockerConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockerConfig&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.plan, _this.plan) || other.plan == _this.plan)&&const DeepCollectionEquality().equals(other.allowedPackages, _this.allowedPackages)&&(identical(other.strictness, _this.strictness) || other.strictness == _this.strictness));
}


@override
int get hashCode {
  final _this = this as BlockerConfig;
  return Object.hash(runtimeType,_this.sessionId,_this.startedAt,_this.plan,const DeepCollectionEquality().hash(_this.allowedPackages),_this.strictness);
}

@override
String toString() {
  final _this = this as BlockerConfig;
  return 'BlockerConfig(sessionId: ${_this.sessionId}, startedAt: ${_this.startedAt}, plan: ${_this.plan}, allowedPackages: ${_this.allowedPackages}, strictness: ${_this.strictness})';
}


}

/// @nodoc
abstract mixin class $BlockerConfigCopyWith<$Res>  {
  factory $BlockerConfigCopyWith(BlockerConfig value, $Res Function(BlockerConfig) _then) = _$BlockerConfigCopyWithImpl;
@useResult
$Res call({
 int sessionId, DateTime startedAt, PomodoroPlan plan, List<String> allowedPackages, Strictness strictness
});


$PomodoroPlanCopyWith<$Res> get plan;

}
/// @nodoc
class _$BlockerConfigCopyWithImpl<$Res>
    implements $BlockerConfigCopyWith<$Res> {
  _$BlockerConfigCopyWithImpl(this._self, this._then);

  final BlockerConfig _self;
  final $Res Function(BlockerConfig) _then;

/// Create a copy of BlockerConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? startedAt = null,Object? plan = null,Object? allowedPackages = null,Object? strictness = null,}) {
  return _then(BlockerConfig(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PomodoroPlan,allowedPackages: null == allowedPackages ? _self.allowedPackages : allowedPackages // ignore: cast_nullable_to_non_nullable
as List<String>,strictness: null == strictness ? _self.strictness : strictness // ignore: cast_nullable_to_non_nullable
as Strictness,
  ));
}
/// Create a copy of BlockerConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PomodoroPlanCopyWith<$Res> get plan {
  
  return $PomodoroPlanCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [BlockerConfig].
extension BlockerConfigPatterns on BlockerConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockerConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockerConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockerConfig value)  $default,){
final _that = this;
switch (_that) {
case _BlockerConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockerConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BlockerConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sessionId,  DateTime startedAt,  PomodoroPlan plan,  List<String> allowedPackages,  Strictness strictness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockerConfig() when $default != null:
return $default(_that.sessionId,_that.startedAt,_that.plan,_that.allowedPackages,_that.strictness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sessionId,  DateTime startedAt,  PomodoroPlan plan,  List<String> allowedPackages,  Strictness strictness)  $default,) {final _that = this;
switch (_that) {
case _BlockerConfig():
return $default(_that.sessionId,_that.startedAt,_that.plan,_that.allowedPackages,_that.strictness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sessionId,  DateTime startedAt,  PomodoroPlan plan,  List<String> allowedPackages,  Strictness strictness)?  $default,) {final _that = this;
switch (_that) {
case _BlockerConfig() when $default != null:
return $default(_that.sessionId,_that.startedAt,_that.plan,_that.allowedPackages,_that.strictness);case _:
  return null;

}
}

}

/// @nodoc


class _BlockerConfig extends BlockerConfig {
  const _BlockerConfig({required this.sessionId, required this.startedAt, required this.plan, required  List<String> allowedPackages, required this.strictness}): _allowedPackages = allowedPackages,super._();
  

@override final  int sessionId;
@override final  DateTime startedAt;
@override final  PomodoroPlan plan;
 final  List<String> _allowedPackages;
@override List<String> get allowedPackages {
  if (_allowedPackages is EqualUnmodifiableListView) return _allowedPackages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedPackages);
}

@override final  Strictness strictness;

/// Create a copy of BlockerConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockerConfigCopyWith<_BlockerConfig> get copyWith => __$BlockerConfigCopyWithImpl<_BlockerConfig>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockerConfig&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.plan, plan) || other.plan == plan)&&const DeepCollectionEquality().equals(other.allowedPackages, _allowedPackages)&&(identical(other.strictness, strictness) || other.strictness == strictness));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sessionId,startedAt,plan,const DeepCollectionEquality().hash(_allowedPackages),strictness);
}

@override
String toString() {
    return 'BlockerConfig(sessionId: $sessionId, startedAt: $startedAt, plan: $plan, allowedPackages: $allowedPackages, strictness: $strictness)';
}


}

/// @nodoc
abstract mixin class _$BlockerConfigCopyWith<$Res> implements $BlockerConfigCopyWith<$Res> {
  factory _$BlockerConfigCopyWith(_BlockerConfig value, $Res Function(_BlockerConfig) _then) = __$BlockerConfigCopyWithImpl;
@override @useResult
$Res call({
 int sessionId, DateTime startedAt, PomodoroPlan plan, List<String> allowedPackages, Strictness strictness
});


@override $PomodoroPlanCopyWith<$Res> get plan;

}
/// @nodoc
class __$BlockerConfigCopyWithImpl<$Res>
    implements _$BlockerConfigCopyWith<$Res> {
  __$BlockerConfigCopyWithImpl(this._self, this._then);

  final _BlockerConfig _self;
  final $Res Function(_BlockerConfig) _then;

/// Create a copy of BlockerConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? startedAt = null,Object? plan = null,Object? allowedPackages = null,Object? strictness = null,}) {
  return _then(_BlockerConfig(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PomodoroPlan,allowedPackages: null == allowedPackages ? _self._allowedPackages : allowedPackages // ignore: cast_nullable_to_non_nullable
as List<String>,strictness: null == strictness ? _self.strictness : strictness // ignore: cast_nullable_to_non_nullable
as Strictness,
  ));
}

/// Create a copy of BlockerConfig
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
