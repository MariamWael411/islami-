abstract class AppError {
  String error;

  AppError({required this.error});
}

class NetworkError extends AppError {
  NetworkError({String error = 'No internet connection please try again'})
    : super(error: error);
}

class ServerError extends AppError {
  ServerError({String error = 'Server is down please try again later'})
    : super(error: error);
}

class UnKnownError extends AppError {
  UnKnownError({String error = 'Something went wrong'}) : super(error: error);
}
