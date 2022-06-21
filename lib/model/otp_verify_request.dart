import 'package:json_annotation/json_annotation.dart';
part 'otp_verify_request.g.dart';


@JsonSerializable()
class VerifyOTPRequest {
  VerifyOTPRequest({
    required this.mobile,
    required this.otp,
    required this.code,
  });

  final String mobile;
  final String otp;
  final String code;

  Map<String, dynamic> toJson() => _$VerifyOTPRequestToJson(this);

}
