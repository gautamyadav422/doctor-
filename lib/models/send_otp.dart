import 'package:json_annotation/json_annotation.dart';

part 'send_otp.g.dart';

@JsonSerializable()
class SendOTP {

  SendOTP({
   required this.mobile
});

  final String mobile;
  
  Map<String, dynamic> toJson() => _$SendOTPToJson(this);
  
}