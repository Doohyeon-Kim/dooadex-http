import 'dart:convert';

import 'package:dooadex_constants/dooadex_constants.dart';
import 'package:dooadex_error_handler/dooadex_error_handler.dart';
import 'package:dooadex_http/src/http_utils/dooadex_http_config.dart';
import 'package:dooadex_http/src/http_utils/dooadex_http_utils.dart';
import 'package:dooadex_logger/dooadex_logger.dart';
import 'package:http/http.dart';

class DdxHttpResponse {
  static dynamic get(Response response) {
    late dynamic responseJson;
    final DdxError? ddxError;

    DdxHttpConfig.jsonDecodingOption == DdxHttpConst.jsonEncodingOption.utf8
        ? DdxHttpUtil.jsonDecodeFromUTF8(response: response)
        : DdxHttpUtil.jsonDecode(response: response);

    switch (response.statusCode) {
      case 200: // OK
      case 201: // Created
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        DdxLogger.httpResponse(httpResponse: response);
        return responseJson;
      case 204: // No Content
        DdxLogger.httpResponse(httpResponse: response);
        break;
      case 400: // Bad Request
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.badRequest(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);
      case 401: // Unauthorized
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.unauthorized(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);

      case 403: // Forbidden
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.forbidden(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);

      case 404: // Not Found
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.notFound(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);

      case 408: // Request Timeout
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.requestTimeout(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);

      case 409: // Conflict
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.conflict(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);

      case 500: // Internal Server Error
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.internalServerError(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);

      case 503: // Service Unavailable
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        ddxError = DdxErrors.serviceUnavailable(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DdxException(ddxError);

      default:
        ddxError = DdxErrors.unknownError();
        throw DdxException(ddxError);
    }
  }
}
