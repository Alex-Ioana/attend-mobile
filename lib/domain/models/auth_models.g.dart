// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  name: json['name'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  avatarUrl: json['avatarUrl'] as String? ?? 'https://i.pravatar.cc/150',
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'role': _$UserRoleEnumMap[instance.role]!,
  'avatarUrl': instance.avatarUrl,
};

const _$UserRoleEnumMap = {
  UserRole.clubber: 'clubber',
  UserRole.curator: 'curator',
  UserRole.space: 'space',
};

_CuratorProfile _$CuratorProfileFromJson(Map<String, dynamic> json) =>
    _CuratorProfile(
      id: json['id'] as String,
      userId: json['userId'] as String,
      handle: json['handle'] as String,
      bio: json['bio'] as String,
      followersCount: (json['followersCount'] as num).toInt(),
      fansCount: (json['fansCount'] as num).toInt(),
      eventsCount: (json['eventsCount'] as num).toInt(),
      isVerified: json['isVerified'] as bool,
      residentAt: json['residentAt'] as String,
    );

Map<String, dynamic> _$CuratorProfileToJson(_CuratorProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'handle': instance.handle,
      'bio': instance.bio,
      'followersCount': instance.followersCount,
      'fansCount': instance.fansCount,
      'eventsCount': instance.eventsCount,
      'isVerified': instance.isVerified,
      'residentAt': instance.residentAt,
    };

_SpaceProfile _$SpaceProfileFromJson(Map<String, dynamic> json) =>
    _SpaceProfile(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      capacity: (json['capacity'] as num).toInt(),
      currentEnergy: (json['currentEnergy'] as num).toInt(),
    );

Map<String, dynamic> _$SpaceProfileToJson(_SpaceProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'capacity': instance.capacity,
      'currentEnergy': instance.currentEnergy,
    };
