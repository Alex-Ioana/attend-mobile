// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Shoutout {

 String get id; String get curatorId; String get curatorName; String get curatorAvatar; String get content; DateTime get postedAt; int get likesCount; int get commentsCount; bool get isLive;
/// Create a copy of Shoutout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoutoutCopyWith<Shoutout> get copyWith => _$ShoutoutCopyWithImpl<Shoutout>(this as Shoutout, _$identity);

  /// Serializes this Shoutout to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shoutout&&(identical(other.id, id) || other.id == id)&&(identical(other.curatorId, curatorId) || other.curatorId == curatorId)&&(identical(other.curatorName, curatorName) || other.curatorName == curatorName)&&(identical(other.curatorAvatar, curatorAvatar) || other.curatorAvatar == curatorAvatar)&&(identical(other.content, content) || other.content == content)&&(identical(other.postedAt, postedAt) || other.postedAt == postedAt)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,curatorId,curatorName,curatorAvatar,content,postedAt,likesCount,commentsCount,isLive);

@override
String toString() {
  return 'Shoutout(id: $id, curatorId: $curatorId, curatorName: $curatorName, curatorAvatar: $curatorAvatar, content: $content, postedAt: $postedAt, likesCount: $likesCount, commentsCount: $commentsCount, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class $ShoutoutCopyWith<$Res>  {
  factory $ShoutoutCopyWith(Shoutout value, $Res Function(Shoutout) _then) = _$ShoutoutCopyWithImpl;
@useResult
$Res call({
 String id, String curatorId, String curatorName, String curatorAvatar, String content, DateTime postedAt, int likesCount, int commentsCount, bool isLive
});




}
/// @nodoc
class _$ShoutoutCopyWithImpl<$Res>
    implements $ShoutoutCopyWith<$Res> {
  _$ShoutoutCopyWithImpl(this._self, this._then);

  final Shoutout _self;
  final $Res Function(Shoutout) _then;

/// Create a copy of Shoutout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? curatorId = null,Object? curatorName = null,Object? curatorAvatar = null,Object? content = null,Object? postedAt = null,Object? likesCount = null,Object? commentsCount = null,Object? isLive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,curatorId: null == curatorId ? _self.curatorId : curatorId // ignore: cast_nullable_to_non_nullable
as String,curatorName: null == curatorName ? _self.curatorName : curatorName // ignore: cast_nullable_to_non_nullable
as String,curatorAvatar: null == curatorAvatar ? _self.curatorAvatar : curatorAvatar // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,postedAt: null == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as DateTime,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Shoutout].
extension ShoutoutPatterns on Shoutout {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shoutout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shoutout() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shoutout value)  $default,){
final _that = this;
switch (_that) {
case _Shoutout():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shoutout value)?  $default,){
final _that = this;
switch (_that) {
case _Shoutout() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String curatorId,  String curatorName,  String curatorAvatar,  String content,  DateTime postedAt,  int likesCount,  int commentsCount,  bool isLive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shoutout() when $default != null:
return $default(_that.id,_that.curatorId,_that.curatorName,_that.curatorAvatar,_that.content,_that.postedAt,_that.likesCount,_that.commentsCount,_that.isLive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String curatorId,  String curatorName,  String curatorAvatar,  String content,  DateTime postedAt,  int likesCount,  int commentsCount,  bool isLive)  $default,) {final _that = this;
switch (_that) {
case _Shoutout():
return $default(_that.id,_that.curatorId,_that.curatorName,_that.curatorAvatar,_that.content,_that.postedAt,_that.likesCount,_that.commentsCount,_that.isLive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String curatorId,  String curatorName,  String curatorAvatar,  String content,  DateTime postedAt,  int likesCount,  int commentsCount,  bool isLive)?  $default,) {final _that = this;
switch (_that) {
case _Shoutout() when $default != null:
return $default(_that.id,_that.curatorId,_that.curatorName,_that.curatorAvatar,_that.content,_that.postedAt,_that.likesCount,_that.commentsCount,_that.isLive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shoutout implements Shoutout {
  const _Shoutout({required this.id, required this.curatorId, required this.curatorName, required this.curatorAvatar, required this.content, required this.postedAt, required this.likesCount, required this.commentsCount, this.isLive = false});
  factory _Shoutout.fromJson(Map<String, dynamic> json) => _$ShoutoutFromJson(json);

@override final  String id;
@override final  String curatorId;
@override final  String curatorName;
@override final  String curatorAvatar;
@override final  String content;
@override final  DateTime postedAt;
@override final  int likesCount;
@override final  int commentsCount;
@override@JsonKey() final  bool isLive;

/// Create a copy of Shoutout
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoutoutCopyWith<_Shoutout> get copyWith => __$ShoutoutCopyWithImpl<_Shoutout>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoutoutToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shoutout&&(identical(other.id, id) || other.id == id)&&(identical(other.curatorId, curatorId) || other.curatorId == curatorId)&&(identical(other.curatorName, curatorName) || other.curatorName == curatorName)&&(identical(other.curatorAvatar, curatorAvatar) || other.curatorAvatar == curatorAvatar)&&(identical(other.content, content) || other.content == content)&&(identical(other.postedAt, postedAt) || other.postedAt == postedAt)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,curatorId,curatorName,curatorAvatar,content,postedAt,likesCount,commentsCount,isLive);

@override
String toString() {
  return 'Shoutout(id: $id, curatorId: $curatorId, curatorName: $curatorName, curatorAvatar: $curatorAvatar, content: $content, postedAt: $postedAt, likesCount: $likesCount, commentsCount: $commentsCount, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class _$ShoutoutCopyWith<$Res> implements $ShoutoutCopyWith<$Res> {
  factory _$ShoutoutCopyWith(_Shoutout value, $Res Function(_Shoutout) _then) = __$ShoutoutCopyWithImpl;
@override @useResult
$Res call({
 String id, String curatorId, String curatorName, String curatorAvatar, String content, DateTime postedAt, int likesCount, int commentsCount, bool isLive
});




}
/// @nodoc
class __$ShoutoutCopyWithImpl<$Res>
    implements _$ShoutoutCopyWith<$Res> {
  __$ShoutoutCopyWithImpl(this._self, this._then);

  final _Shoutout _self;
  final $Res Function(_Shoutout) _then;

/// Create a copy of Shoutout
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? curatorId = null,Object? curatorName = null,Object? curatorAvatar = null,Object? content = null,Object? postedAt = null,Object? likesCount = null,Object? commentsCount = null,Object? isLive = null,}) {
  return _then(_Shoutout(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,curatorId: null == curatorId ? _self.curatorId : curatorId // ignore: cast_nullable_to_non_nullable
as String,curatorName: null == curatorName ? _self.curatorName : curatorName // ignore: cast_nullable_to_non_nullable
as String,curatorAvatar: null == curatorAvatar ? _self.curatorAvatar : curatorAvatar // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,postedAt: null == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as DateTime,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QRChallenge {

 String get id; String get spaceId; String get nonce; DateTime get expiresAt;
/// Create a copy of QRChallenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QRChallengeCopyWith<QRChallenge> get copyWith => _$QRChallengeCopyWithImpl<QRChallenge>(this as QRChallenge, _$identity);

  /// Serializes this QRChallenge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QRChallenge&&(identical(other.id, id) || other.id == id)&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spaceId,nonce,expiresAt);

@override
String toString() {
  return 'QRChallenge(id: $id, spaceId: $spaceId, nonce: $nonce, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $QRChallengeCopyWith<$Res>  {
  factory $QRChallengeCopyWith(QRChallenge value, $Res Function(QRChallenge) _then) = _$QRChallengeCopyWithImpl;
@useResult
$Res call({
 String id, String spaceId, String nonce, DateTime expiresAt
});




}
/// @nodoc
class _$QRChallengeCopyWithImpl<$Res>
    implements $QRChallengeCopyWith<$Res> {
  _$QRChallengeCopyWithImpl(this._self, this._then);

  final QRChallenge _self;
  final $Res Function(QRChallenge) _then;

/// Create a copy of QRChallenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? spaceId = null,Object? nonce = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as String,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QRChallenge].
extension QRChallengePatterns on QRChallenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QRChallenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QRChallenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QRChallenge value)  $default,){
final _that = this;
switch (_that) {
case _QRChallenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QRChallenge value)?  $default,){
final _that = this;
switch (_that) {
case _QRChallenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String spaceId,  String nonce,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QRChallenge() when $default != null:
return $default(_that.id,_that.spaceId,_that.nonce,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String spaceId,  String nonce,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _QRChallenge():
return $default(_that.id,_that.spaceId,_that.nonce,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String spaceId,  String nonce,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _QRChallenge() when $default != null:
return $default(_that.id,_that.spaceId,_that.nonce,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QRChallenge implements QRChallenge {
  const _QRChallenge({required this.id, required this.spaceId, required this.nonce, required this.expiresAt});
  factory _QRChallenge.fromJson(Map<String, dynamic> json) => _$QRChallengeFromJson(json);

@override final  String id;
@override final  String spaceId;
@override final  String nonce;
@override final  DateTime expiresAt;

/// Create a copy of QRChallenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QRChallengeCopyWith<_QRChallenge> get copyWith => __$QRChallengeCopyWithImpl<_QRChallenge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QRChallengeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QRChallenge&&(identical(other.id, id) || other.id == id)&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spaceId,nonce,expiresAt);

@override
String toString() {
  return 'QRChallenge(id: $id, spaceId: $spaceId, nonce: $nonce, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$QRChallengeCopyWith<$Res> implements $QRChallengeCopyWith<$Res> {
  factory _$QRChallengeCopyWith(_QRChallenge value, $Res Function(_QRChallenge) _then) = __$QRChallengeCopyWithImpl;
@override @useResult
$Res call({
 String id, String spaceId, String nonce, DateTime expiresAt
});




}
/// @nodoc
class __$QRChallengeCopyWithImpl<$Res>
    implements _$QRChallengeCopyWith<$Res> {
  __$QRChallengeCopyWithImpl(this._self, this._then);

  final _QRChallenge _self;
  final $Res Function(_QRChallenge) _then;

/// Create a copy of QRChallenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? spaceId = null,Object? nonce = null,Object? expiresAt = null,}) {
  return _then(_QRChallenge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as String,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
