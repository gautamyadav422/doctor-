// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPVerifyResponse _$OTPVerifyResponseFromJson(Map<String, dynamic> json) =>
    OTPVerifyResponse(
      meta: json['meta'] == null
          ? null
          : OTPVerifyMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : OTPVrifyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OTPVerifyResponseToJson(OTPVerifyResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

OTPVerifyMeta _$OTPVerifyMetaFromJson(Map<String, dynamic> json) =>
    OTPVerifyMeta(
      status: json['status'] as int? ?? 0,
      isError: json['is_error'] as bool? ?? false,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OTPVerifyMetaToJson(OTPVerifyMeta instance) =>
    <String, dynamic>{
      'status': instance.status,
      'is_error': instance.isError,
      'message': instance.message,
    };

OTPVrifyData _$OTPVrifyDataFromJson(Map<String, dynamic> json) => OTPVrifyData(
      otpcode: json['code'] as String?,
    );

Map<String, dynamic> _$OTPVrifyDataToJson(OTPVrifyData instance) =>
    <String, dynamic>{
      'code': instance.otpcode,
    };
