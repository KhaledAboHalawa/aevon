// result.dart
import 'package:aevon/core/errors/errors_handler.dart';
import 'package:equatable/equatable.dart';

abstract class Result<T> extends Equatable {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    if (this is Success<T>) return success((this as Success<T>).data);
    return error((this as Error<T>).failure);
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
