import 'dart:async';
import 'dart:io';

import 'package:gazua_error_handler/gazua_error_handler.dart';
import 'package:gazua_logger/gazua_logger.dart';
import 'package:http/http.dart' as http;
import '../../gazua_http.dart';
import '../constant/http_constant.dart';
import '../http_utils/gazua_http_config.dart';
class GzHttpClient {
  GzHttpClient._();

  static Future<dynamic> get(
      {required String path, int? port, Map<String, dynamic>? queryParameters, String? query, String? token}) async {
    final Uri uri = GzHttpRequest.generateUri(path: path, port: port, queryParameters: queryParameters, query: query);
    final Map<String, String> headers = GzHttpRequest.generateHeaders(token: token);
    http.Request request = GzHttpRequest.generateRequest(method: GzHttpConst.method.get, headers: headers, uri: uri);
    GzLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse = await request.send().timeout(GzHttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return GzHttpResponse.get(result);
    } on TimeoutException {
      GzException.requestTimeout();
    } on GzException {}
  }

  static Future<dynamic> post(
      {required String path, int? port, required Map<String, dynamic> body, String? token}) async {
    final Uri uri = GzHttpRequest.generateUri(path: path, port: port);

    final Map<String, String> headers = GzHttpRequest.generateHeaders(token: token);
    http.Request request =
        GzHttpRequest.generateRequest(method: GzHttpConst.method.post, headers: headers, uri: uri, body: body);
    GzLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse = await request.send().timeout(GzHttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return GzHttpResponse.get(result);
    } on TimeoutException {
      GzException.requestTimeout();
    } on GzException {}
  }

  static Future<dynamic> put(
      {required String path, int? port, required Map<String, dynamic> body, String? token}) async {
    final Uri uri = GzHttpRequest.generateUri(path: path, port: port);
    final Map<String, String> headers = GzHttpRequest.generateHeaders(token: token);
    http.Request request =
        GzHttpRequest.generateRequest(method: GzHttpConst.method.put, headers: headers, uri: uri, body: body);
    GzLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse = await request.send().timeout(GzHttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return GzHttpResponse.get(result);
    } on TimeoutException {
      GzException.requestTimeout();
    } on GzException {}
  }

  static Future<dynamic> delete(
      {required String path, int? port, required Map<String, dynamic> body, String? token}) async {
    final Uri uri = GzHttpRequest.generateUri(path: path, port: port);
    final Map<String, String> headers = GzHttpRequest.generateHeaders(token: token);
    http.Request request =
        GzHttpRequest.generateRequest(method: GzHttpConst.method.delete, headers: headers, uri: uri, body: body);
    GzLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse = await request.send().timeout(GzHttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return GzHttpResponse.get(result);
    } on TimeoutException {
      GzException.requestTimeout();
    } on GzException {}
  }

  static Future<dynamic> patch(
      {required String path, int? port, required Map<String, dynamic> body, String? token}) async {
    final Uri uri = GzHttpRequest.generateUri(path: path, port: port);
    final Map<String, String> headers = GzHttpRequest.generateHeaders(token: token);
    http.Request request =
        GzHttpRequest.generateRequest(method: GzHttpConst.method.patch, headers: headers, uri: uri, body: body);
    GzLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse = await request.send().timeout(GzHttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return GzHttpResponse.get(result);
    } on TimeoutException {
      GzException.requestTimeout();
    } on GzException {}
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
    GzHttpRequest.generateMultipartHeaders(token: token);
    http.MultipartRequest request = http.MultipartRequest(method, url);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    GzLogger.multipartRequest(multipartRequest: request);

    try {
      http.StreamedResponse streamedResponse = await request.send().timeout(GzHttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return GzHttpResponse.get(result);
    } on TimeoutException {
      GzException.requestTimeout();
    } on GzException {}
  }

  static Future<dynamic> external(
      {required String uriAddress,
      required String method,
      Map<String, dynamic>? queryParameters,
      String? query,
      Map<String, dynamic>? body,
      String? token}) async {
    final Uri uri = GzHttpRequest.externalUri(uriAddress: uriAddress, queryParameters: queryParameters);
    final Map<String, String> headers = GzHttpRequest.generateHeaders(token: token);
    http.Request request = GzHttpRequest.generateRequest(method: method, headers: headers, body: body, uri: uri);
    GzLogger.httpRequest(httpRequest: request);

    try {
      final streamedResponse = await request.send().timeout(GzHttpConfig.networkTimeLimit);
      final result = await http.Response.fromStream(streamedResponse);
      return GzHttpResponse.get(result);
    } on TimeoutException {
      GzException.requestTimeout();
    } on GzException {}
  }
}
