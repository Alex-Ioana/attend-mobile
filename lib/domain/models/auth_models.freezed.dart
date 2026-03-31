// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get name; UserRole get role; String get avatarUrl;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,avatarUrl);

@override
String toString() {
  return 'User(id: $id, name: $name, role: $role, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String name, UserRole role, String avatarUrl
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? avatarUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  UserRole role,  String avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  UserRole role,  String avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.name,_that.role,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  UserRole role,  String avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.name, required this.role, this.avatarUrl = 'https://i.pravatar.cc/150'});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String name;
@override final  UserRole role;
@override@JsonKey() final  String avatarUrl;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role,avatarUrl);

@override
String toString() {
  return 'User(id: $id, name: $name, role: $role, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, UserRole role, String avatarUrl
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? avatarUrl = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CuratorProfile {

 String get id; String get userId; String get handle; String get bio; int get followersCount; int get fansCount; int get eventsCount; bool get isVerified; String get residentAt;
/// Create a copy of CuratorProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CuratorProfileCopyWith<CuratorProfile> get copyWith => _$CuratorProfileCopyWithImpl<CuratorProfile>(this as CuratorProfile, _$identity);

  /// Serializes this CuratorProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CuratorProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.fansCount, fansCount) || other.fansCount == fansCount)&&(identical(other.eventsCount, eventsCount) || other.eventsCount == eventsCount)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.residentAt, residentAt) || other.residentAt == residentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,handle,bio,followersCount,fansCount,eventsCount,isVerified,residentAt);

@override
String toString() {
  return 'CuratorProfile(id: $id, userId: $userId, handle: $handle, bio: $bio, followersCount: $followersCount, fansCount: $fansCount, eventsCount: $eventsCount, isVerified: $isVerified, residentAt: $residentAt)';
}


}

/// @nodoc
abstract mixin class $CuratorProfileCopyWith<$Res>  {
  factory $CuratorProfileCopyWith(CuratorProfile value, $Res Function(CuratorProfile) _then) = _$CuratorProfileCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String handle, String bio, int followersCount, int fansCount, int eventsCount, bool isVerified, String residentAt
});




}
/// @nodoc
class _$CuratorProfileCopyWithImpl<$Res>
    implements $CuratorProfileCopyWith<$Res> {
  _$CuratorProfileCopyWithImpl(this._self, this._then);

  final CuratorProfile _self;
  final $Res Function(CuratorProfile) _then;

/// Create a copy of CuratorProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? handle = null,Object? bio = null,Object? followersCount = null,Object? fansCount = null,Object? eventsCount = null,Object? isVerified = null,Object? residentAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,fansCount: null == fansCount ? _self.fansCount : fansCount // ignore: cast_nullable_to_non_nullable
as int,eventsCount: null == eventsCount ? _self.eventsCount : eventsCount // ignore: cast_nullable_to_non_nullable
as int,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,residentAt: null == residentAt ? _self.residentAt : residentAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CuratorProfile].
extension CuratorProfilePatterns on CuratorProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CuratorProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CuratorProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CuratorProfile value)  $default,){
final _that = this;
switch (_that) {
case _CuratorProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CuratorProfile value)?  $default,){
final _that = this;
switch (_that) {
case _CuratorProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String handle,  String bio,  int followersCount,  int fansCount,  int eventsCount,  bool isVerified,  String residentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CuratorProfile() when $default != null:
return $default(_that.id,_that.userId,_that.handle,_that.bio,_that.followersCount,_that.fansCount,_that.eventsCount,_that.isVerified,_that.residentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String handle,  String bio,  int followersCount,  int fansCount,  int eventsCount,  bool isVerified,  String residentAt)  $default,) {final _that = this;
switch (_that) {
case _CuratorProfile():
return $default(_that.id,_that.userId,_that.handle,_that.bio,_that.followersCount,_that.fansCount,_that.eventsCount,_that.isVerified,_that.residentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String handle,  String bio,  int followersCount,  int fansCount,  int eventsCount,  bool isVerified,  String residentAt)?  $default,) {final _that = this;
switch (_that) {
case _CuratorProfile() when $default != null:
return $default(_that.id,_that.userId,_that.handle,_that.bio,_that.followersCount,_that.fansCount,_that.eventsCount,_that.isVerified,_that.residentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CuratorProfile implements CuratorProfile {
  const _CuratorProfile({required this.id, required this.userId, required this.handle, required this.bio, required this.followersCount, required this.fansCount, required this.eventsCount, required this.isVerified, required this.residentAt});
  factory _CuratorProfile.fromJson(Map<String, dynamic> json) => _$CuratorProfileFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String handle;
@override final  String bio;
@override final  int followersCount;
@override final  int fansCount;
@override final  int eventsCount;
@override final  bool isVerified;
@override final  String residentAt;

/// Create a copy of CuratorProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CuratorProfileCopyWith<_CuratorProfile> get copyWith => __$CuratorProfileCopyWithImpl<_CuratorProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CuratorProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CuratorProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.fansCount, fansCount) || other.fansCount == fansCount)&&(identical(other.eventsCount, eventsCount) || other.eventsCount == eventsCount)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.residentAt, residentAt) || other.residentAt == residentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,handle,bio,followersCount,fansCount,eventsCount,isVerified,residentAt);

@override
String toString() {
  return 'CuratorProfile(id: $id, userId: $userId, handle: $handle, bio: $bio, followersCount: $followersCount, fansCount: $fansCount, eventsCount: $eventsCount, isVerified: $isVerified, residentAt: $residentAt)';
}


}

/// @nodoc
abstract mixin class _$CuratorProfileCopyWith<$Res> implements $CuratorProfileCopyWith<$Res> {
  factory _$CuratorProfileCopyWith(_CuratorProfile value, $Res Function(_CuratorProfile) _then) = __$CuratorProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String handle, String bio, int followersCount, int fansCount, int eventsCount, bool isVerified, String residentAt
});




}
/// @nodoc
class __$CuratorProfileCopyWithImpl<$Res>
    implements _$CuratorProfileCopyWith<$Res> {
  __$CuratorProfileCopyWithImpl(this._self, this._then);

  final _CuratorProfile _self;
  final $Res Function(_CuratorProfile) _then;

/// Create a copy of CuratorProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? handle = null,Object? bio = null,Object? followersCount = null,Object? fansCount = null,Object? eventsCount = null,Object? isVerified = null,Object? residentAt = null,}) {
  return _then(_CuratorProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,fansCount: null == fansCount ? _self.fansCount : fansCount // ignore: cast_nullable_to_non_nullable
as int,eventsCount: null == eventsCount ? _self.eventsCount : eventsCount // ignore: cast_nullable_to_non_nullable
as int,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,residentAt: null == residentAt ? _self.residentAt : residentAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SpaceProfile {

 String get id; String get userId; String get name; String get address; String get description; int get capacity; int get currentEnergy;
/// Create a copy of SpaceProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpaceProfileCopyWith<SpaceProfile> get copyWith => _$SpaceProfileCopyWithImpl<SpaceProfile>(this as SpaceProfile, _$identity);

  /// Serializes this SpaceProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpaceProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.currentEnergy, currentEnergy) || other.currentEnergy == currentEnergy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,address,description,capacity,currentEnergy);

@override
String toString() {
  return 'SpaceProfile(id: $id, userId: $userId, name: $name, address: $address, description: $description, capacity: $capacity, currentEnergy: $currentEnergy)';
}


}

/// @nodoc
abstract mixin class $SpaceProfileCopyWith<$Res>  {
  factory $SpaceProfileCopyWith(SpaceProfile value, $Res Function(SpaceProfile) _then) = _$SpaceProfileCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name, String address, String description, int capacity, int currentEnergy
});




}
/// @nodoc
class _$SpaceProfileCopyWithImpl<$Res>
    implements $SpaceProfileCopyWith<$Res> {
  _$SpaceProfileCopyWithImpl(this._self, this._then);

  final SpaceProfile _self;
  final $Res Function(SpaceProfile) _then;

/// Create a copy of SpaceProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? address = null,Object? description = null,Object? capacity = null,Object? currentEnergy = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,currentEnergy: null == currentEnergy ? _self.currentEnergy : currentEnergy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SpaceProfile].
extension SpaceProfilePatterns on SpaceProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpaceProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpaceProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpaceProfile value)  $default,){
final _that = this;
switch (_that) {
case _SpaceProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpaceProfile value)?  $default,){
final _that = this;
switch (_that) {
case _SpaceProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String address,  String description,  int capacity,  int currentEnergy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpaceProfile() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.address,_that.description,_that.capacity,_that.currentEnergy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String address,  String description,  int capacity,  int currentEnergy)  $default,) {final _that = this;
switch (_that) {
case _SpaceProfile():
return $default(_that.id,_that.userId,_that.name,_that.address,_that.description,_that.capacity,_that.currentEnergy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String name,  String address,  String description,  int capacity,  int currentEnergy)?  $default,) {final _that = this;
switch (_that) {
case _SpaceProfile() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.address,_that.description,_that.capacity,_that.currentEnergy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpaceProfile implements SpaceProfile {
  const _SpaceProfile({required this.id, required this.userId, required this.name, required this.address, required this.description, required this.capacity, required this.currentEnergy});
  factory _SpaceProfile.fromJson(Map<String, dynamic> json) => _$SpaceProfileFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String name;
@override final  String address;
@override final  String description;
@override final  int capacity;
@override final  int currentEnergy;

/// Create a copy of SpaceProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpaceProfileCopyWith<_SpaceProfile> get copyWith => __$SpaceProfileCopyWithImpl<_SpaceProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpaceProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpaceProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.currentEnergy, currentEnergy) || other.currentEnergy == currentEnergy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,address,description,capacity,currentEnergy);

@override
String toString() {
  return 'SpaceProfile(id: $id, userId: $userId, name: $name, address: $address, description: $description, capacity: $capacity, currentEnergy: $currentEnergy)';
}


}

/// @nodoc
abstract mixin class _$SpaceProfileCopyWith<$Res> implements $SpaceProfileCopyWith<$Res> {
  factory _$SpaceProfileCopyWith(_SpaceProfile value, $Res Function(_SpaceProfile) _then) = __$SpaceProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name, String address, String description, int capacity, int currentEnergy
});




}
/// @nodoc
class __$SpaceProfileCopyWithImpl<$Res>
    implements _$SpaceProfileCopyWith<$Res> {
  __$SpaceProfileCopyWithImpl(this._self, this._then);

  final _SpaceProfile _self;
  final $Res Function(_SpaceProfile) _then;

/// Create a copy of SpaceProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? address = null,Object? description = null,Object? capacity = null,Object? currentEnergy = null,}) {
  return _then(_SpaceProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,currentEnergy: null == currentEnergy ? _self.currentEnergy : currentEnergy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
