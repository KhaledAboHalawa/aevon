part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final SignInEntity? signInResonse;
  final bool isLoading;
  const AuthState({
    required this.isLoading,
    required this.errorMessage,
    this.signInResonse,
  });

  const AuthState.initial()
      : errorMessage = '',
        signInResonse = null,
        isLoading = false;
  AuthState copyWith({
    String? errorMessage,
    SignInEntity? signInResonse,
    bool? isLoading,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      signInResonse: signInResonse ?? this.signInResonse,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [errorMessage, signInResonse, isLoading];
}
