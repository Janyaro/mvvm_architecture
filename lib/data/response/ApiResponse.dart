import 'package:nvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.Loading;
  ApiResponse.completed() : status = Status.Complete;
  ApiResponse.Error() : status = Status.Error;

  String toString() {
    return "status $status \n data $data \n message $message";
  }
}
