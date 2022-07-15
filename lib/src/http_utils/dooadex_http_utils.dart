import 'dart:convert' as convert;
import 'package:dooadex_constants/dooadex_constants.dart';
import 'package:dooadex_logger/dooadex_logger.dart';
import 'package:http/http.dart' as http;

class DdxHttpUtil {
  static dynamic encodeRequestBodyToJson(dynamic data, String contentType) {
    return contentType == DdxHttpConst.contentType.json ? convert.utf8.encode(convert.jsonEncode(data)) : data;
  }

  static jsonDecode({required http.Response response}) {
    return convert.jsonDecode(response.body);
  }

  static jsonDecodeFromUTF8({required http.Response response}) {
    return convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
  }

  static void requestLogger({required http.Request request}) {
    DdxLogger.httpRequest(httpRequest: request);
  }

  static void responseLogger({required http.Response response}) {
    DdxLogger.httpResponse(httpResponse: response);
  }
}
