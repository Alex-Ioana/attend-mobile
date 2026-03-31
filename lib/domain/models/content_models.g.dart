// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shoutout _$ShoutoutFromJson(Map<String, dynamic> json) => _Shoutout(
  id: json['id'] as String,
  curatorId: json['curatorId'] as String,
  curatorName: json['curatorName'] as String,
  curatorAvatar: json['curatorAvatar'] as String,
  content: json['content'] as String,
  postedAt: DateTime.parse(json['postedAt'] as String),
  likesCount: (json['likesCount'] as num).toInt(),
  commentsCount: (json['commentsCount'] as num).toInt(),
  isLive: json['isLive'] as bool? ?? false,
);

Map<String, dynamic> _$ShoutoutToJson(_Shoutout instance) => <String, dynamic>{
  'id': instance.id,
  'curatorId': instance.curatorId,
  'curatorName': instance.curatorName,
  'curatorAvatar': instance.curatorAvatar,
  'content': instance.content,
  'postedAt': instance.postedAt.toIso8601String(),
  'likesCount': instance.likesCount,
  'commentsCount': instance.commentsCount,
  'isLive': instance.isLive,
};

_QRChallenge _$QRChallengeFromJson(Map<String, dynamic> json) => _QRChallenge(
  id: json['id'] as String,
  spaceId: json['spaceId'] as String,
  nonce: json['nonce'] as String,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$QRChallengeToJson(_QRChallenge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spaceId': instance.spaceId,
      'nonce': instance.nonce,
      'expiresAt': instance.expiresAt.toIso8601String(),
    };
