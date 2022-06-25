// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityReposnse _$EntityReposnseFromJson(Map<String, dynamic> json) =>
    EntityReposnse(
      meta: json['meta'] == null
          ? null
          : EntityMetadata.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EntityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityReposnseToJson(EntityReposnse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

EntityMetadata _$EntityMetadataFromJson(Map<String, dynamic> json) =>
    EntityMetadata(
      status: json['status'] as int? ?? 0,
      isError: json['is_error'] as bool? ?? false,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EntityMetadataToJson(EntityMetadata instance) =>
    <String, dynamic>{
      'status': instance.status,
      'is_error': instance.isError,
      'message': instance.message,
    };

EntityData _$EntityDataFromJson(Map<String, dynamic> json) => EntityData(
      id: json['id'] as int? ?? 0,
      entity: (json['user_profile'] as List<dynamic>?)
          ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityDataToJson(EntityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_profile': instance.entity,
    };

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      enityName: json['profile_name'] as String?,
      id: json['profile_id'] as String?,
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'profile_name': instance.enityName,
      'profile_id': instance.id,
    };
