import '../constant/http_constant.dart';
import '../http_utils/gazua_http_config.dart';

class GzHttp {
  GzHttp._();

  static init(
      {String? scheme,
      required String host,
      int? port,
      String? contentType,
      String? tokenType,
      JsonDecodingOption? jsonDecodingOption}) {
    GzHttpConfig.scheme = scheme ?? "https";
    GzHttpConfig.host = host;
    GzHttpConfig.port = port;
    GzHttpConfig.contentType = contentType ?? GzHttpConfig.contentType;
    GzHttpConfig.tokenType = tokenType ?? GzHttpConfig.tokenType;
    GzHttpConfig.jsonDecodingOption = jsonDecodingOption ?? GzHttpConfig.jsonDecodingOption;
  }
}
