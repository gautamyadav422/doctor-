import 'dart:convert';
import 'dart:io';

import 'package:doctor/api/api_path.dart';
import 'package:doctor/util/log.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RestClient extends GetConnect {
  final defaultTimeOut = const Duration(seconds: kDebugMode ? 30 : 45);

  @override
  void onInit() {
    super.onInit();
    Log.d('inside onInit of RestClient');
    setupRestClient();
  }

  void setupRestClient() {
    httpClient.baseUrl = kDebugMode ? APIPath.devBaseUrl : APIPath.prodBaseUrl;
    httpClient.timeout = defaultTimeOut;

    /// Add request interceptor
    _addRequestInterceptor();

    /// Add response interceptor
    _addResponseInterceptor();
  }

  void _addRequestInterceptor() {
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

  void _addResponseInterceptor() {
    httpClient.addResponseModifier((request, response) {
      Log.d('API Endpoint: ${request.url.path}');
      Log.d('Status Code: ${response.statusCode}');

      Log.d(response.toString());

      return response;
    });
  }

  Map<String, String> _getHeaders() {
    Map<String, String> headers = {};
    headers['content-type'] = 'application/json';
    return headers;
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) async {
    try {
      final response = await super.get(
        url,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
      );

      if (response.hasError) {
        _handleErrorResponse(response);
      }

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException {
      throw const FormatException('Failed to process data');
    }
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    try {
      final response = await super.post(
        url,
        body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );

      if (response.hasError) {
        _handleErrorResponse(response);
      }

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException {
      throw const FormatException('Failed to process data');
    }
  }

  @override
  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {

    try {
      final response = await super.put(
        url,
        body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );

      if (response.hasError) {
        _handleErrorResponse(response);
      }

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException {
      throw const FormatException('Failed to process data');
    }
  }

  void _handleErrorResponse(Response<dynamic> response) {
    String errorMessage;
    try {
      final json = jsonDecode(response.bodyString!);
      errorMessage = json['data'];
    } catch (e) {
      switch (response.statusCode) {
        case 500:
          errorMessage = 'Internal Server Error';
          break;
        default:
          errorMessage = 'Something went wrong. Please try after sometime';
      }
    }

    throw errorMessage;
  }
}
