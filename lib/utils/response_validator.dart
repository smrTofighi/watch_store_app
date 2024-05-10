class HTTPResponseValidator {
  static bool isValidStatusCode(int statusCode){
    if(statusCode >= 200 && statusCode <300){
      return true;
    }
    else {
      throw HTTPException(statusCode);
    }
  }
}


class HTTPException implements Exception {
  final int statusCode;
  HTTPException(this.statusCode);
  @override
  String toString() {
    String message;

    switch (statusCode) {
      case 400:
        message = 'Bad Request';
        break;
      case 401:
        message = 'Unauthorized';
        break;
      case 403:
        message = 'Forbidden';
        break;
      case 409:
        message = 'Conflict';
        break;
      case 500:
        message = 'Internet Server Error';
        break;
      default: 
        message = 'Unknow Error';

    }
    return 'HTTP Exception: Status Code $statusCode, Message : $message';
  }
}
