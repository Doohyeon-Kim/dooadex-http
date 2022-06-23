import '../http_utils/http_config.dart';

class DooadexHttp {
  DooadexHttp._();

  static init({String? scheme, required String host, int? port, String? contentType, String? tokenType}) {
    HttpConfig.scheme = scheme ?? "https";
    HttpConfig.host = host;
    HttpConfig.port = port;
    HttpConfig.contentType = contentType ?? HttpConfig.contentType;
    HttpConfig.tokenType = tokenType ?? HttpConfig.tokenType;
  }
}
