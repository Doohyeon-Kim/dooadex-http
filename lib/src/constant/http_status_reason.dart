class HttpStatusReason {
  /// Informational 1xx
  String continue_ = "Continue"; // 100
  String switchingProtocols = "Switching Protocols"; // 101
  String processing = "Processing"; // 102

  /// Successful 2xx
  String ok = "OK"; // 200
  String created = "Created"; // 201
  String accepted = "Accepted"; // 202
  String nonAuthoritativeInformation = "Non-Authoritative Information"; // 203
  String noContent = "No Content"; // 204
  String resetContent = "Reset Content"; // 205
  String partialContent = "Partial Content"; // 206
  String multiStatus = "Multi-Status"; // 207
  String alreadyReported = "Already Reported"; // 208
  String imUsed = "IM Used"; // 226

  /// Redirection 3xx
  String multipleChoices = "Multiple Choices"; // 300
  String movedPermanently = "Moved Permanently"; // 301
  String found = "Found"; // 302
  String movedTemporarily = "Moved Temporarily"; // 302, Common alias for found.
  String seeOther = "See Other"; // 303
  String notModified = "Not Modified"; // 304
  String useProxy = "User Proxy"; // 305
  String temporaryRedirect = "Temporary Redirect"; // 307

  /// Client Error 4xx
  String badRequest = "Bad Request"; // 400
  String unauthorized = "Unauthorized"; // 401
  String paymentRequired = "Payment Required"; // 402
  String forbidden = "Forbidden"; // 403
  String notFound = "Not Found"; // 404
  String methodNotAllowed = "Method Not Allowed"; // 405
  String notAcceptable = "Not Acceptable"; // 406
  String proxyAuthenticationRequired = "Proxy Authentication Required"; // 407
  String requestTimeout = "Request Timeout"; // 408
  String conflict = "Conflict"; // 409
  String gone = "Gone"; // 410
  String lengthRequired = "Length Required"; // 411
  String preconditionFailed = "Precondition Failed"; // 412
  String requestEntityTooLarge = "Request Entity Too Large"; // 413
  String requestUriTooLong = "Request Uri Too Long"; // 414
  String unsupportedMediaType = "Unsupported Media Type"; // 415
  String requestedRangeNotSatisfiable = "Requested Range Not Satisfiable"; // 416
  String expectationFailed = "Expectation Failed"; // 417
  String imATeapot = "I'm a teapot"; // 418
  String enhanceYourCalm = "Enhance Your Calm"; // 420
  String misdirectedRequest = "Misdirected Request"; // 421
  String unprocessableEntity = "Unprocessable Entity"; // 422
  String locked = "Locked"; // 423
  String failedDependency = "Failed Dependency"; // 424
  String reservedForWebDav = "Reserved for WebDAV"; // 425
  String upgradeRequired = "Upgrade Required"; // 426
  String preconditionRequired = "Precondition Required"; // 428
  String tooManyRequests = "Too Many Requests"; // 429
  String requestHeaderFieldsTooLarge = "Request Header Fields Too Large"; // 431
  String connectionClosedWithoutResponse = "Connection Closed Without Response"; // 444
  String retryWith = "Retry With"; // 449
  String blockedByWindowsParentalControls = "Blocked By Windows Parental Controls"; // 450
  String unavailableForLegalReasons = "Unavailable For Legal Reasons"; // 451
  String clientClosedRequest = "Client Closed Request"; // 499

  /// Server Error 5xx
  String internalServerError = "Internal Server Error"; // 500
  String notImplemented = "Not Implemented"; // 501
  String badGateway = "Bad Gateway"; // 502
  String serviceUnavailable = "Service Unavailable"; // 503
  String gatewayTimeout = "Gateway Timeout"; // 504
  String httpVersionNotSupported = "HTTP Version Not Supported"; // 505
  String variantAlsoNegotiates = "Variant Also Negotiates"; // 506
  String insufficientStorage = "Insufficient Storage"; // 507
  String loopDetected = "Loop Detected"; // 508
  String bandwidthLimitExceeded = "Bandwidth Limit Exceeded"; // 509
  String notExtended = "Not Extended"; // 510
  String networkAuthenticationRequired = "Network Authentication Required"; // 511
  String networkReadTimeoutError = "Network Read TimeoutError"; // 598
  String networkConnectTimeoutError = "Network Connect TimeoutError"; // 599
}
