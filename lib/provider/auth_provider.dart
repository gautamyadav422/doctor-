import 'package:doctor/api/api_path.dart';
import 'package:doctor/api/rest_client.dart';
import 'package:doctor/constant/key_constant.dart';
import 'package:doctor/model/country_response.dart';
import 'package:doctor/model/otp_verify_request.dart';
import 'package:doctor/model/otp_verify_response.dart';
import 'package:doctor/model/pre_existing_request.dart';
import 'package:doctor/model/pre_existing_response.dart';
import 'package:doctor/model/send_otp_request.dart';
import 'package:doctor/model/send_otp_response.dart';
import 'package:doctor/util/log.dart';

class AuthProvider extends RestClient {
  Future<SendOTPData?> sendOTP(SendOTPRequest otp) async {
    final requestBody = otp.toJson();
    final response = await post(APIPath.sendOTPUrl, requestBody,
        contentType: 'application/x-www-form-urlencoded',
        decoder: (dynamic json) => SendOTPResponse.fromJson(json));
    Log.d('response: ${response.bodyString}');

    if (response.body?.meta?.status == 200) {
      return response.body?.data;
    } else {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }
  }

  /// Get Contry Code
  Future<List<Country>> getCountry() async {
    final response = await get(APIPath.getCountryCode,
        decoder: (dynamic json) => CountryResponse.fromJson(json));
    Log.d(' getCountry response: ${response.bodyString}');

    if (response.body?.meta?.status == 200) {
      return response.body?.data?.results ?? [];
    } else {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }
  }

  ///Verify OTP
  Future<bool> verifyOTP(VerifyOTPRequest verifyotp) async {
    final requestBody = verifyotp.toJson();
    final response = await post(APIPath.verifyOTPUrl, requestBody,
        contentType: 'application/x-www-form-urlencoded',
        decoder: (dynamic json) => OTPVerifyResponse.fromJson(json));

    Log.d('verifyOTP response: ${response.bodyString}');

    if (response.body?.meta?.status == 200) {
      return true;
    } else {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }
  }

  /// Verify Consumer
  Future<List<ExistingUser>> verifyConsumer(PreExistingCustomerRequest preExistingCustomerRequest) async {

    final requestBody = preExistingCustomerRequest.toJson();
    final response = await post(APIPath.preExistingConsumer, requestBody,
        contentType: 'application/x-www-form-urlencoded',
        decoder: (dynamic json) => PreExistingResponse.fromJson(json));

    Log.d('verifyConsumer response: ${response.bodyString}');
    if (response.body?.meta?.status == 200) {
      return response.body?.data?.existing_profiles  ?? [];
    } else {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }
  }


}
