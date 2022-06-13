import 'package:doctor/model/send_otp_request.dart';
import 'package:doctor/provider/auth_provider.dart';

class AuthRepository {

  AuthRepository({required this.provider});

  final AuthProvider provider;

  Future<void> sendOTP(SendOTPRequest otp) async{
    return await provider.sendOTP(otp);
  }
}