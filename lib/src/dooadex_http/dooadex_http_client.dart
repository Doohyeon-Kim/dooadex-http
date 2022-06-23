import 'dart:async';
import 'dart:io';

import 'package:dooadex_error_handler/dooadex_error_handler.dart';
import 'package:dooadex_logger/dooadex_logger.dart';
import 'package:http/http.dart' as http;
import 'package:dooadex_constants/dooadex_constants.dart';
import '../http_utils/http_config.dart';
import 'dooadex_http_request.dart';
import 'dooadex_http_response.dart';

class DooadexHttpClient {
  DooadexHttpClient._();

  static Future<dynamic> get(
      {required String path,
      int? port,
      Map<String, dynamic>? queryParameters,
      String? query,
      String? token}) async {
    final Uri uri = DooadexHttpRequest.generateUri(
        path: path, port: port, queryParameters: queryParameters, query: query);
    final Map<String, String> headers =
        DooadexHttpRequest.generateHeaders(token: token);
    http.Request request = DooadexHttpRequest.generateRequest(
        method: HttpConstant.method.get, headers: headers, uri: uri);
    DooadexLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse =
          await request.send().timeout(HttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return DooadexHttpResponse.get(result);
    } on TimeoutException {
      DooadexException.requestTimeout();
    } on DooadexException {
      rethrow;
    }
  }

  static Future<dynamic> post(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token}) async {
    final Uri uri = DooadexHttpRequest.generateUri(path: path, port: port);

    final Map<String, String> headers =
        DooadexHttpRequest.generateHeaders(token: token);
    http.Request request = DooadexHttpRequest.generateRequest(
        method: HttpConstant.method.post, headers: headers, uri: uri);
    DooadexLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse =
          await request.send().timeout(HttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return DooadexHttpResponse.get(result);
    } on TimeoutException {
      DooadexException.requestTimeout();
    } on DooadexException {
      rethrow;
    }
  }

  static Future<dynamic> put(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token}) async {
    final Uri uri = DooadexHttpRequest.generateUri(path: path, port: port);
    final Map<String, String> headers =
        DooadexHttpRequest.generateHeaders(token: token);
    http.Request request = DooadexHttpRequest.generateRequest(
        method: HttpConstant.method.put, headers: headers, uri: uri);
    DooadexLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse =
          await request.send().timeout(HttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return DooadexHttpResponse.get(result);
    } on TimeoutException {
      DooadexException.requestTimeout();
    } on DooadexException {
      rethrow;
    }
  }

  static Future<dynamic> delete(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token}) async {
    final Uri uri = DooadexHttpRequest.generateUri(path: path, port: port);
    final Map<String, String> headers =
        DooadexHttpRequest.generateHeaders(token: token);
    http.Request request = DooadexHttpRequest.generateRequest(
        method: HttpConstant.method.delete, headers: headers, uri: uri);
    DooadexLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse =
          await request.send().timeout(HttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return DooadexHttpResponse.get(result);
    } on TimeoutException {
      DooadexException.requestTimeout();
    } on DooadexException {
      rethrow;
    }
  }

  static Future<dynamic> patch(
      {required String path,
      int? port,
      required Map<String, dynamic> body,
      String? token}) async {
    final Uri uri = DooadexHttpRequest.generateUri(path: path, port: port);
    final Map<String, String> headers =
        DooadexHttpRequest.generateHeaders(token: token);
    http.Request request = DooadexHttpRequest.generateRequest(
        method: HttpConstant.method.patch, headers: headers, uri: uri);
    DooadexLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse =
          await request.send().timeout(HttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return DooadexHttpResponse.get(result);
    } on TimeoutException {
      DooadexException.requestTimeout();
    } on DooadexException {
      rethrow;
    }
  }

  static Future<dynamic> multipart({
    required String uriAddress,
    required String method,
    Map<String, dynamic>? queryParameters,
    String? query,
    required File file,
    String? token,
  }) async {
    Uri url = Uri.parse(uriAddress);
    DooadexHttpRequest.generateMultipartHeaders(token: token);
    http.MultipartRequest request = http.MultipartRequest(method, url);

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    DooadexLogger.multipartRequest(multipartRequest: request);

    try {
      http.StreamedResponse streamedResponse =
          await request.send().timeout(HttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return DooadexHttpResponse.get(result);
    } on TimeoutException {
      DooadexException.requestTimeout();
    } on DooadexException {
      rethrow;
    }
  }

  static Future<dynamic> external(
      {required String uriAddress,
      required String method,
      Map<String, dynamic>? queryParameters,
      String? query,
      Map<String, dynamic>? body,
      String? token}) async {
    final Uri uri = DooadexHttpRequest.externalUri(
        uriAddress: uriAddress, queryParameters: queryParameters);
    final Map<String, String> headers =
        DooadexHttpRequest.generateHeaders(token: token);
    http.Request request = DooadexHttpRequest.generateRequest(
        method: method, headers: headers, body: body, uri: uri);
    DooadexLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse =
          await request.send().timeout(HttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return DooadexHttpResponse.get(result);
    } on TimeoutException {
      DooadexException.requestTimeout();
    } on DooadexException {
      rethrow;
    }
  }
}
