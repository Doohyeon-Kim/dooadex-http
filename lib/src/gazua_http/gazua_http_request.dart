import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant/http_constant.dart';
import '../http_utils/gazua_http_config.dart';

class GzHttpRequest {
  GzHttpRequest._();

  static Map<String, String>? headers;
  static Uri? uri;

  static Map<String, String> _generateBaseHeaders() {
    final Map<String, String> baseHeaders = {
      'Content-Type': GzHttpConfig.contentType,
    };
    return baseHeaders;
  }

  static Map<String, String> _generateAuthorizationHeader(String token) {
    final Map<String, String> authorizationHeader = {
      'Authorization': "${GzHttpConst.tokenType.bearer} $token"
    };
    return authorizationHeader;
  }

  static Map<String, String> generateHeaders({String? token}) {
    headers = _generateBaseHeaders();
    if (token != null) {
      headers!.addAll(_generateAuthorizationHeader(token));
    }
    return headers!;
  }

  static Map<String, String> generateMultipartHeaders({String? token}) {
    headers = {'Content-Type': 'multipart/form-data'};
    if (token != null) {
      headers!.addAll(_generateAuthorizationHeader(token));
    }
    return headers!;
  }

  static Uri generateUri(
      {String? scheme,
      String? host,
      int? port,
      required String path,
      Map<String, dynamic>? queryParameters,
      String? query}) {
    uri = Uri(
        scheme: scheme ?? GzHttpConfig.scheme,
        host: host ?? GzHttpConfig.host,
        port: port,
        path: path,
        queryParameters: queryParameters,
        query: query);
    return uri!;
  }

  static Uri externalUri(
      {required String uriAddress, Map<String, dynamic>? queryParameters}) {
    if (queryParameters == null) {
      uri = Uri.parse(uriAddress);
    } else {
      uri = Uri(path: uriAddress, queryParameters: queryParameters);
    }
    return uri!;
  }

  static http.Request generateRequest(
      {required String method,
      required Map<String, String> headers,
      required Uri uri,
      Map<String, dynamic>? body}) {
    http.Request request = http.Request(method, uri);
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    return request;
  }
}
