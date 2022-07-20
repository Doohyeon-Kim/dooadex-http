import '../constant/http_constant.dart';

class GzHttpConfig {
  GzHttpConfig._();

  static String scheme = "https";
  static String host = "localhost";
  static int? port = 3000;
  static String contentType = GzHttpConst.contentType.json;
  static String tokenType = GzHttpConst.tokenType.bearer;
  static Duration networkTimeLimit = const Duration(milliseconds: 20000);
  static JsonDecodingOption jsonDecodingOption = GzHttpConst.jsonEncodingOption.noOption;
}
