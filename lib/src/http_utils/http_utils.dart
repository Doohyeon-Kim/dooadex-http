import 'dart:convert';
import 'package:dooadex_constants/dooadex_constants.dart';
import 'package:dooadex_logger/dooadex_logger.dart';
import 'package:http/http.dart' as http;


class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return contentType == HttpConstant.contentType.json ? utf8.encode(json.encode(data)) : data;
  }

  static void requestLogger({required http.Request request}) {
    DooadexLogger.httpRequest(httpRequest: request);
  }

  static void responseLogger({required http.Response response}) {
    DooadexLogger.httpResponse(httpResponse: response);
  }
}
