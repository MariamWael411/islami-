import '../../../../core/error/app_error.dart';

sealed class ApiResult<T> {
  bool get isSuccess => this is SuccessApiResult;

  bool get isError => this is ErrorApiResult;

  T get getData => (this as SuccessApiResult).data;

  AppError get getError => (this as ErrorApiResult).errorMessage;
}

class SuccessApiResult<T> extends ApiResult<T> {
  T? data;

  SuccessApiResult({required this.data});
}

class ErrorApiResult<T> extends ApiResult<T> {
  AppError errorMessage;

  ErrorApiResult({required this.errorMessage});
}
