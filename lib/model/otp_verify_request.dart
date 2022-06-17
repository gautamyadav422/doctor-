import 'package:json_annotation/json_annotation.dart';
part 'otp_verify_request.g.dart';


@JsonSerializable()
class VerifyOTPRequest {
  VerifyOTPRequest({
    required this.mobile,
    required this.user_profile,
    required this.otp,
  });

  final String mobile;
  final String user_profile;
  final String otp;

  Map<String, dynamic> toJson() => _$VerifyOTPRequestToJson(this);

}
