import 'package:gmoney/models/send_otp.dart';
import 'package:gmoney/provider/auth_provider.dart';

class AuthRepository {

  AuthRepository({required this.provider});

  final AuthProvider provider;

  Future<void> sendOTP(SendOTP otp) async{
    return await provider.sendOTP(otp);
  }
}