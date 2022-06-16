import 'package:dooadex_constants/dooadex_constants.dart';

class HttpConfig {
  HttpConfig._();

  static String scheme = "https";
  static String host = "localhost:3000";
  static String contentType = HttpConstant.contentType.json;
  static String tokenType = HttpConstant.tokenType.bearer;

  static Duration networkTimeLimit = const Duration(milliseconds: 20000);
}
