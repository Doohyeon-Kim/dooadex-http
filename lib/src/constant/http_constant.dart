class GzHttpConst {
  GzHttpConst._();

  // ignore: library_private_types_in_public_api
  static _ContentType contentType = _ContentType();

  // ignore: library_private_types_in_public_api
  static _TokenType tokenType = _TokenType();

  // ignore: library_private_types_in_public_api
  static _Method method = _Method();

  // ignore: library_private_types_in_public_api
  static _JsonDecodingOption jsonEncodingOption = _JsonDecodingOption();
}

class _ContentType {
  String json = "application/json";
}

class _TokenType {
  String bearer = "Bearer ";
}

enum HttpMethod { get, post, put, delete, patch, multipart }

class _Method {
  String get = HttpMethod.get.name;
  String post = HttpMethod.post.name;
  String put =  HttpMethod.put.name;
  String delete =  HttpMethod.delete.name;
  String patch =  HttpMethod.patch.name;
  String multipart =  HttpMethod.multipart.name;
}

enum JsonDecodingOption {
  noOption,
  utf8,
}

class _JsonDecodingOption {
  JsonDecodingOption noOption = JsonDecodingOption.noOption;
  JsonDecodingOption utf8 = JsonDecodingOption.utf8;
}
