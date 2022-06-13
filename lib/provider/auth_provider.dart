import 'package:doctor/api/api_path.dart';
import 'package:doctor/api/rest_client.dart';
import 'package:doctor/model/send_otp_request.dart';
import 'package:doctor/util/log.dart';

class AuthProvider extends RestClient {
  Future<void> sendOTP(SendOTPRequest otp) async {
    final requestBody = otp.toJson();
    final response = await post(
      APIPath.sendOTPUrl,
      requestBody,
      contentType: 'application/x-www-form-urlencoded',
    );
    Log.d('response: ${response.bodyString}');
    if (response.hasError) {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }
  }
}
