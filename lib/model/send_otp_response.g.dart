// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOTPResponse _$SendOTPResponseFromJson(Map<String, dynamic> json) =>
    SendOTPResponse(
      meta: json['meta'] == null
          ? null
          : SendOTPMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : SendOTPData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendOTPResponseToJson(SendOTPResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

SendOTPMeta _$SendOTPMetaFromJson(Map<String, dynamic> json) => SendOTPMeta(
      status: json['status'] as int? ?? 0,
      isError: json['is_error'] as bool? ?? false,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SendOTPMetaToJson(SendOTPMeta instance) =>
    <String, dynamic>{
      'status': instance.status,
      'is_error': instance.isError,
      'message': instance.message,
    };

SendOTPData _$SendOTPDataFromJson(Map<String, dynamic> json) => SendOTPData(
      otpcode: json['code'] as String?,
    );

Map<String, dynamic> _$SendOTPDataToJson(SendOTPData instance) =>
    <String, dynamic>{
      'code': instance.otpcode,
    };
