class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});

  bool get isSuccess => error == null;
  
}

class Error extends Result {
  Error({super.error});
}

class Success<T> extends Result<T> {
  Success({super.data});
}
