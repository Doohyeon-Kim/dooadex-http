class HttpStatusCode {
  /// Informational 1xx
  int continue_ = 100;
  int switchingProtocols = 101;
  int processing = 102;

  /// Successful 2xx
  int ok = 200;
  int created = 201;
  int accepted = 202;
  int nonAuthoritativeInformation = 203;
  int noContent = 204;
  int resetContent = 205;
  int partialContent = 206;
  int multiStatus = 207;
  int alreadyReported = 208;
  int imUsed = 226;

  /// Redirection 3xx
  int multipleChoices = 300;
  int movedPermanently = 301;
  int found = 302;
  int movedTemporarily = 302; // common alias fo nd.;
  int seeOther = 303;
  int notModified = 304;
  int useProxy = 305;
  int temporaryRedirect = 307;

  /// Client Error 4xx
  int badRequest = 400;
  int unauthorized = 401;
  int paymentRequired = 402;
  int forbidden = 403;
  int notFound = 404;
  int methodNotAllowed = 405;
  int notAcceptable = 406;
  int proxyAuthenticationRequired = 407;
  int requestTimeout = 408;
  int conflict = 409;
  int gone = 410;
  int lengthRequired = 411;
  int preconditionFailed = 412;
  int requestEntityTooLarge = 413;
  int requestUriTooLong = 414;
  int unsupportedMediaType = 415;
  int requestedRangeNotSatisfiable = 416;
  int expectationFailed = 417;
  int imATeapot = 418;
  int enhanceYourCalm = 420;
  int misdirectedRequest = 421;
  int unprocessableEntity = 422;
  int locked = 423;
  int failedDependency = 424;
  int reservedForWebDav = 425;
  int upgradeRequired = 426;
  int preconditionRequired = 428;
  int tooManyRequests = 429;
  int requestHeaderFieldsTooLarge = 431;
  int connectionClosedWithoutResponse = 444;
  int retryWith = 449;
  int blockedByWindowsParentalControls = 450;
  int unavailableForLegalReasons = 451;
  int clientClosedRequest = 499;

  /// Server Error 5xx
  int internalServerError = 500;
  int notImplemented = 501;
  int badGateway = 502;
  int serviceUnavailable = 503;
  int gatewayTimeout = 504;
  int httpVersionNotSupported = 505;
  int variantAlsoNegotiates = 506;
  int insufficientStorage = 507;
  int loopDetected = 508;
  int bandwidthLimitExceeded = 509;
  int notExtended = 510;
  int networkAuthenticationRequired = 511;
  int networkReadTimeoutError = 598;
  int networkConnectTimeoutError = 599;
}
