import 'package:doctor/model/country_response.dart';
import 'package:doctor/model/otp_verify_request.dart';
import 'package:doctor/model/pre_existing_request.dart';
import 'package:doctor/model/pre_existing_response.dart';
import 'package:doctor/model/send_otp_request.dart';
import 'package:doctor/model/send_otp_response.dart';
import 'package:doctor/provider/auth_provider.dart';

class AuthRepository {

  AuthRepository({required this.provider});

  final AuthProvider provider;

  /// Generate OTP
  Future<SendOTPData?> sendOTP(SendOTPRequest otp) async{
    return await provider.sendOTP(otp);
  }

  ///Get Country
  Future<List<Country>> getCountry() async{
    return await provider.getCountry();
  }

  ///Verify OTP
  Future<bool> verifyOTP(VerifyOTPRequest verifyotp) async{
    return await provider.verifyOTP(verifyotp);
  }
  ///Verify Consumer
  Future<List<ExistingUser>> verifyConsumer(PreExistingCustomerRequest preExistingCustomerRequest) async{
    return await provider.verifyConsumer(preExistingCustomerRequest);
  }

}