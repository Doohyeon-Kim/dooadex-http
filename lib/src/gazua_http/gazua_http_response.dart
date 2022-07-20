
import 'package:gazua_error_handler/gazua_error_handler.dart';
import 'package:gazua_logger/gazua_logger.dart';
import 'package:http/http.dart';

import '../constant/http_constant.dart';
import '../http_utils/gazua_http_config.dart';
import '../http_utils/gazua_http_utils.dart';

class GzHttpResponse {
  static dynamic get(Response response) {
    late dynamic responseJson;
    final GzError? gzError;

    switch (response.statusCode) {
      case 200: // OK
      case 201: // Created
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        GzLogger.httpResponse(httpResponse: response);
        return responseJson;
      case 204: // No Content
        GzLogger.httpResponse(httpResponse: response);
        break;
      case 400: // Bad Request
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.badRequest(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);
      case 401: // Unauthorized
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.unauthorized(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);

      case 403: // Forbidden
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.forbidden(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);

      case 404: // Not Found
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.notFound(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);

      case 408: // Request Timeout
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.requestTimeout(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);

      case 409: // Conflict
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.conflict(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);

      case 500: // Internal Server Error
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.internalServerError(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);

      case 503: // Service Unavailable
        responseJson = GzHttpConfig.jsonDecodingOption == GzHttpConst.jsonEncodingOption.utf8
            ? GzHttpUtil.jsonDecodeFromUTF8(response: response)
            : GzHttpUtil.jsonDecode(response: response);
        gzError = GzErrors.serviceUnavailable(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw GzException(gzError);

      default:
        gzError = GzErrors.unknownError();
        throw GzException(gzError);
    }
  }
}
