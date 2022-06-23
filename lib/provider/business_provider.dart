import 'dart:ffi';

import 'package:doctor/api/api_path.dart';
import 'package:doctor/api/rest_client.dart';
import 'package:doctor/constant/app_constant.dart';
import 'package:doctor/constant/key_constant.dart';
import 'package:doctor/model/entity_response.dart';
import 'package:doctor/model/pan_number_request.dart';
import 'package:doctor/util/log.dart';

class BusinessDetailsProvider extends RestClient {
  /// Get Entity
  Future<List<Entity>> getEntity() async {
    final response = await get(
        APIPath.getEntity + "?source=" + AppConstants.sourcecode.toString(),
        decoder: (dynamic json) => EntityReposnse.fromJson(json));
    Log.d(' getEntity response: ${response.bodyString}');

    if (response.body?.meta?.status == 200) {
      return response.body?.data?[0].entity ?? [];
    } else {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }
  }


  Future<void> panVerify(PANVerifyRequest pannumber) async {
    final requestBody = pannumber.toJson();
    final response = await post(APIPath.verifyPan, requestBody,
        contentType: 'application/x-www-form-urlencoded',
       // decoder: (dynamic json) => SendOTPResponse.fromJson(json)
    );
    Log.d('Pan verify response: ${response.bodyString}');

   /* if (response.body?.meta?.status == 200) {
      return response.body?.data;
    } else {
      ///Need to handle proper error case
      throw Exception("Failed to hit the API");
    }*/
  }

}
