import 'dart:convert';

import 'package:dooadex_error_handler/dooadex_error_handler.dart';
import 'package:dooadex_logger/dooadex_logger.dart';
import 'package:http/http.dart';

class DooadexHttpResponse {
  static dynamic get(Response response) {
    late dynamic responseJson;
    final DooadexError? dooadexError;

    switch (response.statusCode) {
      case 200: // OK
      case 201: // Created
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        DooadexLogger.httpResponse(httpResponse: response);
        return responseJson;
      case 204: // No Content
        DooadexLogger.httpResponse(httpResponse: response);
        break;
      case 400: // Bad Request
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        dooadexError = DooadexErrors.badRequest(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);
      case 401: // Unauthorized
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        dooadexError = DooadexErrors.unauthorized(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 403: // Forbidden
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        dooadexError = DooadexErrors.forbidden(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 404: // Not Found
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        dooadexError = DooadexErrors.notFound(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 408: // Request Timeout
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        dooadexError = DooadexErrors.requestTimeout(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 409: // Not Found
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        dooadexError = DooadexErrors.conflict(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 500: // Internal Server Error
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        dooadexError = DooadexErrors.internalServerError(
            type: responseJson['error']['type'],
            message: responseJson['error']['message'],
            title: responseJson['error']['title'],
            detail: responseJson['error']['detail']);
        throw DooadexException(dooadexError);

      case 503: // Service Unavailable
        responseJson = jsonDecode(utf8.decode(response.bodyBytes));
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
