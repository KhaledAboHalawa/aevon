part of 'forget_password_bloc.dart';

class ForgetPasswordState extends Equatable {
  final String? errorMessage;
  final bool isLoading;
  final int currentPage;
  final String email;
  const ForgetPasswordState({
    this.errorMessage,
    this.isLoading = false,
    this.currentPage = 0,
    this.email = '',
  });

  ForgetPasswordState copyWith({
    String? errorMessage,
    bool? isLoading,
    int? currentPage,
    String? email,
  }) {
    return ForgetPasswordState(
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [errorMessage, isLoading, currentPage, email];
}
