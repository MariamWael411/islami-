enum ApiStatus { intial, success, error, loading }

class Resource<T> {
  T? data;
  String? errorMessage;
  ApiStatus? apiStatus;

  Resource({
    required this.apiStatus,
    required this.errorMessage,
    required this.data,
  });

  Resource.initial() {
    apiStatus = ApiStatus.intial;
  }

  Resource.success({required this.data}) {
    apiStatus = ApiStatus.success;
  }

  Resource.error({required this.errorMessage}) {
    apiStatus = ApiStatus.error;
  }

  Resource.loading() {
    apiStatus = ApiStatus.loading;
  }

  bool get isSuccess => apiStatus == ApiStatus.success;

  bool get isError => apiStatus == ApiStatus.error;

  bool get isLoading => apiStatus == ApiStatus.loading;
}
