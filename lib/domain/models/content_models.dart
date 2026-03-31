import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_models.freezed.dart';
part 'content_models.g.dart';

@freezed
abstract class Shoutout with _$Shoutout {
  const factory Shoutout({
    required String id,
    required String curatorId,
    required String curatorName,
    required String curatorAvatar,
    required String content,
    required DateTime postedAt,
    required int likesCount,
    required int commentsCount,
    @Default(false) bool isLive,
  }) = _Shoutout;

  factory Shoutout.fromJson(Map<String, dynamic> json) => _$ShoutoutFromJson(json);
}

@freezed
abstract class QRChallenge with _$QRChallenge {
  const factory QRChallenge({
    required String id,
    required String spaceId,
    required String nonce,
    required DateTime expiresAt,
  }) = _QRChallenge;

  factory QRChallenge.fromJson(Map<String, dynamic> json) => _$QRChallengeFromJson(json);
}
