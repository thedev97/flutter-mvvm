import 'status.dart';

class AppResponse<T> {
  Status? status;
  T? data;
  String? msg;

  AppResponse(this.status, this.data, this.msg);

  AppResponse.loading() : status = Status.LOADING;

  AppResponse.completed() : status = Status.COMPLETED;

  AppResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $msg \n Data : $data";
  }
}
