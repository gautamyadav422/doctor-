// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_existing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreExistingResponse _$PreExistingResponseFromJson(Map<String, dynamic> json) =>
    PreExistingResponse(
      meta: json['meta'] == null
          ? null
          : PreExistMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : PreExistingData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreExistingResponseToJson(
        PreExistingResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

PreExistMeta _$PreExistMetaFromJson(Map<String, dynamic> json) => PreExistMeta(
      status: json['status'] as int? ?? 0,
      isError: json['is_error'] as bool? ?? false,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PreExistMetaToJson(PreExistMeta instance) =>
    <String, dynamic>{
      'status': instance.status,
      'is_error': instance.isError,
      'message': instance.message,
    };

PreExistingData _$PreExistingDataFromJson(Map<String, dynamic> json) =>
    PreExistingData(
      existing_profiles: (json['existing_profiles'] as List<dynamic>?)
          ?.map((e) => ExistingUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PreExistingDataToJson(PreExistingData instance) =>
    <String, dynamic>{
      'existing_profiles': instance.existing_profiles,
    };

ExistingUser _$ExistingUserFromJson(Map<String, dynamic> json) => ExistingUser(
      user_profile_name: json['user_profile_name'] as String?,
      user_type: json['user_type'] as int? ?? 0,
      is_active: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$ExistingUserToJson(ExistingUser instance) =>
    <String, dynamic>{
      'user_profile_name': instance.user_profile_name,
      'user_type': instance.user_type,
      'is_active': instance.is_active,
    };
