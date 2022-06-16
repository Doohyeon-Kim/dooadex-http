
import 'package:dooadex_constants/dooadex_constants.dart';
import 'package:http/http.dart' as http;

import '../http_utils/http_config.dart';

class DooadexHttpRequest {
  DooadexHttpRequest._();
  static Map<String, String>? headers;
  static Uri? uri;

  static Map<String, String> _generateBaseHeaders() {
    final Map<String, String> baseHeaders = {
      'Content-Type': HttpConfig.contentType,
    };
    return baseHeaders;
  }

  static Map<String, String> _generateAuthorizationHeader(String token) {
    final Map<String, String> authorizationHeader = {'Authorization': "${HttpConstant.tokenType.bearer} $token"};
    return authorizationHeader;
  }

  static Map<String, String> generateHeaders({String? token}) {
    headers = _generateBaseHeaders();
    if (token != null) {
      headers!.addAll(_generateAuthorizationHeader(token));
    }
    return headers!;
  }

  static Uri generateUri(
      {String? scheme, String? host, required String path, Map<String, dynamic>? queryParameters, String? query}) {
    uri = Uri(
        scheme: scheme ?? HttpConfig.scheme,
        host: host ?? HttpConfig.host,
        path: path,
        queryParameters: queryParameters,
        query: query);
    return uri!;
  }

  static Uri externalUri({required String uriAddress, Map<String, dynamic>? queryParameters}) {
    if (queryParameters == null) {
      uri = Uri.parse(uriAddress);
    } else {
      uri = Uri(path: uriAddress, queryParameters: queryParameters);
    }
    return uri!;
  }

  static http.Request generateRequest(
      {required String method, required Map<String, String> headers, required Uri uri}) {
    http.Request request = http.Request(method, uri);
    request.headers.addAll(headers);
    return request;
  }
}
