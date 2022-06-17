// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOTPRequest _$VerifyOTPRequestFromJson(Map<String, dynamic> json) =>
    VerifyOTPRequest(
      mobile: json['mobile'] as String,
      user_profile: json['user_profile'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyOTPRequestToJson(VerifyOTPRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'user_profile': instance.user_profile,
      'otp': instance.otp,
    };
