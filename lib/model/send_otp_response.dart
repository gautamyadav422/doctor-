import 'package:json_annotation/json_annotation.dart';

part 'send_otp_response.g.dart';

@JsonSerializable()
class SendOTPResponse {

  final SendOTPMeta? meta;
  final SendOTPData? data;

  SendOTPResponse({
   this.meta,
    this.data
});

  factory SendOTPResponse.fromJson(Map<String, dynamic> json) => _$SendOTPResponseFromJson(json);

}

@JsonSerializable()
class SendOTPMeta{
  SendOTPMeta({
    this.status = 0,
    this.isError= false,
    this.message
  });

  final int status;
  @JsonKey(name: 'is_error')
  final bool isError;
  final String? message;

  factory SendOTPMeta.fromJson(Map<String, dynamic> json) => _$SendOTPMetaFromJson(json);

}

@JsonSerializable()
class SendOTPData{

  SendOTPData({
    this.otpcode,
});
  @JsonKey(name: 'code')
  final String? otpcode;

  factory SendOTPData.fromJson(Map<String, dynamic> json) => _$SendOTPDataFromJson(json);


}