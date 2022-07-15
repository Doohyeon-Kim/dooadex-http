import 'package:dooadex_constants/dooadex_constants.dart';

import '../http_utils/dooadex_http_config.dart';

class DdxHttp {
  DdxHttp._();

  static init(
      {String? scheme,
      required String host,
      int? port,
      String? contentType,
      String? tokenType,
      JsonDecodingOption? jsonDecodingOption}) {
    DdxHttpConfig.scheme = scheme ?? "https";
    DdxHttpConfig.host = host;
    DdxHttpConfig.port = port;
    DdxHttpConfig.contentType = contentType ?? DdxHttpConfig.contentType;
    DdxHttpConfig.tokenType = tokenType ?? DdxHttpConfig.tokenType;
    DdxHttpConfig.jsonDecodingOption = jsonDecodingOption ?? DdxHttpConfig.jsonDecodingOption;
  }
}
