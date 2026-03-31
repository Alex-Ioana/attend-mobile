import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

enum UserRole { clubber, curator, space }

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String name,
    required UserRole role,
    @Default('https://i.pravatar.cc/150') String avatarUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class CuratorProfile with _$CuratorProfile {
  const factory CuratorProfile({
    required String id,
    required String userId,
    required String handle,
    required String bio,
    required int followersCount,
    required int fansCount,
    required int eventsCount,
    required bool isVerified,
    required String residentAt,
  }) = _CuratorProfile;

  factory CuratorProfile.fromJson(Map<String, dynamic> json) => _$CuratorProfileFromJson(json);
}

@freezed
abstract class SpaceProfile with _$SpaceProfile {
  const factory SpaceProfile({
    required String id,
    required String userId,
    required String name,
    required String address,
    required String description,
    required int capacity,
    required int currentEnergy, // Pulse signal 1-5
  }) = _SpaceProfile;

  factory SpaceProfile.fromJson(Map<String, dynamic> json) => _$SpaceProfileFromJson(json);
}
