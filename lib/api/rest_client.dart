import 'package:doctor/api/api_path.dart';
import 'package:doctor/util/log.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RestClient extends GetConnect {

  final defaultTimeOut = const Duration(seconds: kDebugMode ? 30 : 45);

  @override
  void onInit() {
    super.onInit();
    Log.d('inside onInit');
    setupRestClient();
  }

  void setupRestClient() {
    httpClient.baseUrl = kDebugMode ? APIPath.devBaseUrl : APIPath.prodBaseUrl;
    httpClient.timeout = defaultTimeOut;

    httpClient.addRequestModifier<dynamic>((request) {
      final headers = _getHeaders();
      headers.forEach((key, value) {
        ///check if the content-type header is not added yet.
        ///If not added, then only add content-type header to avoid duplication
        ///or error
        if (request.headers[key] == null) {
          request.headers[key] = value;
        }
      });

      return request;
    });
  }

  Map<String, String> _getHeaders() {
    Map<String, String> headers = {};
    headers['content-type'] = 'application/json';
    return headers;
  }
}