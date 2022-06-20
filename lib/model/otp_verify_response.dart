import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class OTPVerifyResponse{
  final OTPVerifyMeta? meta;
  final OTPVrifyData? data;

  OTPVerifyResponse({
    this.meta,
    this.data
});
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

}
class OTPVrifyData{

}