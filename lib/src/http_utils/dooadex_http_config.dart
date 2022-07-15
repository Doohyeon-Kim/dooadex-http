import 'package:dooadex_constants/dooadex_constants.dart';


class DdxHttpConfig {
  DdxHttpConfig._();

  static String scheme = "https";
  static String host = "localhost";
  static int? port = 3000;
  static String contentType = DdxHttpConst.contentType.json;
  static String tokenType = DdxHttpConst.tokenType.bearer;
  static Duration networkTimeLimit = const Duration(milliseconds: 20000);
  static JsonDecodingOption jsonDecodingOption = DdxHttpConst.jsonEncodingOption.noOption;
}
