class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message';
  }
}
 // when the data is not come or  api request is timeOut
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Internet connection error');
}

// this will happened when the api points is wrong so this error will occur
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

// unauthorized user access the data so this Exception will use

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, 'Unauthorized user access the system');
}
