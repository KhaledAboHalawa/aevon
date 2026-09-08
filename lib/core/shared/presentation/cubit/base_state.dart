import 'package:equatable/equatable.dart';

enum StateStatus { initial, loading, loaded, error }

class BaseState<T> extends Equatable {
  final StateStatus status;
  final T? data;
  final String? error;
  const BaseState({required this.status, this.data, this.error});
  const BaseState.initial() : this(status: StateStatus.initial);
  const BaseState.loading() : this(status: StateStatus.loading);
  const BaseState.loaded(T data) : this(status: StateStatus.loaded, data: data);
  const BaseState.error(String error)
    : this(status: StateStatus.error, error: error);
  @override
  List<Object?> get props => [status, data, error];
}

extension BaseStateExtensions<T> on BaseState<T> {
  bool get isLoading => status == StateStatus.loading;
  bool get isLoaded => status == StateStatus.loaded;
  bool get isError => status == StateStatus.error;
  bool get isInitial => status == StateStatus.initial;
}
