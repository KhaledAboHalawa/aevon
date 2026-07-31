part of 'forget_password_bloc.dart';

class ForgetPasswordState extends Equatable {
  final String? errorMessage;
  final bool isLoading;
  final int currentPage;
  const ForgetPasswordState({
    this.errorMessage,
    this.isLoading = false,
    this.currentPage = 0,
  });

  ForgetPasswordState copyWith({
    String? errorMessage,
    bool? isLoading,
    int? currentPage,
  }) {
    return ForgetPasswordState(
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [errorMessage, isLoading];
}
