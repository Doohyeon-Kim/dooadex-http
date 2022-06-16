import 'dart:convert';

import 'package:dooadex_error_handler/dooadex_error_handler.dart';
import 'package:dooadex_logger/dooadex_logger.dart';
import 'package:http/http.dart';

class DooadexHttpResponse {
  static dynamic get(Response response) {
    final dynamic responseJson = jsonDecode(utf8.decode(response.bodyBytes));
    final DooadexError? dooadexError;

    switch (response.statusCode) {
      case 200: // OK
      case 201: // Created
        DooadexLogger.httpResponse(httpResponse: response);
        return responseJson;
      case 204: // No Content
        DooadexLogger.httpResponse(httpResponse: response);
        break;
      case 400: // Bad Request
        dooadexError = DooadexErrors.badRequest(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);
      case 401: // Unauthorized
        dooadexError = DooadexErrors.unauthorized(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 403: // Forbidden
        dooadexError = DooadexErrors.forbidden(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 404: // Not Found
        dooadexError = DooadexErrors.notFound(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 500: // Internal Server Error
        dooadexError = DooadexErrors.internalServerError(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 503: // Service Unavailable
        dooadexError = DooadexErrors.serviceUnavailable(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      default:
        dooadexError = DooadexErrors.unknownError();
        throw DooadexException(dooadexError);
    }
  }
}
