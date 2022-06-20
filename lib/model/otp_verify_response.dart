import 'package:json_annotation/json_annotation.dart';
part 'otp_verify_response.g.dart';


@JsonSerializable()
class OTPVerifyResponse{
  final OTPVerifyMeta? meta;
  final OTPVrifyData? data;

  OTPVerifyResponse({
    this.meta,
    this.data
});
  factory OTPVerifyResponse.fromJson(Map<String, dynamic> json) => _$OTPVerifyResponseFromJson(json);


}

@JsonSerializable()
class OTPVerifyMeta{

  OTPVerifyMeta({
    this.status = 0,
    this.isError= false,
    this.message
  });

  final int status;
  @JsonKey(name: 'is_error')
  final bool isError;
  final String? message;

  factory OTPVerifyMeta.fromJson(Map<String, dynamic> json) => _$OTPVerifyMetaFromJson(json);

}
@JsonSerializable()
class OTPVrifyData{
  OTPVrifyData({
    this.otpcode,
  });
  @JsonKey(name: 'code')
  final String? otpcode;

  factory OTPVrifyData.fromJson(Map<String, dynamic> json) => _$OTPVrifyDataFromJson(json);

}