import 'dart:convert' as convert;
import 'package:gazua_logger/gazua_logger.dart';
import 'package:http/http.dart' as http;

import '../constant/http_constant.dart';

class GzHttpUtil {
  static dynamic encodeRequestBodyToJson(dynamic data, String contentType) {
    return contentType == GzHttpConst.contentType.json ? convert.utf8.encode(convert.jsonEncode(data)) : data;
  }

  static jsonDecode({required http.Response response}) {
    return convert.jsonDecode(response.body);
  }

  static jsonDecodeFromUTF8({required http.Response response}) {
    return convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
  }

  static void requestLogger({required http.Request request}) {
    GzLogger.httpRequest(httpRequest: request);
  }

  static void responseLogger({required http.Response response}) {
    GzLogger.httpResponse(httpResponse: response);
  }
}
