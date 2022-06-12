import 'package:gmoney/api/api_path.dart';
import 'package:gmoney/api/rest_client.dart';
import 'package:gmoney/models/send_otp.dart';

class AuthProvider extends RestClient {
  Future<void> sendOTP(SendOTP otp) async {
    final requestBody = otp.toJson();
    final response = await post(
      APIPath.sendOTPUrl,
      requestBody,
      contentType: 'application/x-www-form-urlencoded',
    );
    print('response: ${response.bodyString}');
    if (response.hasError) {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }
  }
}
