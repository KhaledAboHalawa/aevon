// result.dart
import 'package:aevon/core/errors/errors_handler.dart';
import 'package:equatable/equatable.dart';

abstract class Result<T> extends Equatable {
  const Result();

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    switch (this) {
      case Success<T> successResult:
        return success(successResult.data);
      case Error<T> errorResult:
        return error(errorResult.failure);
      default:
        throw Exception('Unknown result type: $this');
    }
  }

  @override
  List<Object?> get props => [];
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);

  @override
  List<Object?> get props => [failure];
}
