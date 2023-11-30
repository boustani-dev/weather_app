abstract class DataState<T> {
  T? data;
  String? error;
  DataState({this.data, this.error});
}

class DataSuccessState<T> extends DataState<T> {
  DataSuccessState(T data) : super(data: data, error: null);
}

class DataFailState<T> extends DataState<T> {
  int? statusCode;
  String? apiErrorMessage;

  DataFailState(
    String error, {
    this.statusCode,
    this.apiErrorMessage,
  }) : super(data: null, error: error);
}
