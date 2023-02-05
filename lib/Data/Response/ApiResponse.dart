import 'package:mvvm/Data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.error(this.message) : status = Status.ERROR;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  @override
  String toString() {
    return '\nStatus: $status \nMessage: $message \nData $data';
  }
}
