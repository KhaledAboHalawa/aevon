part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final AuthEntity? authResonse;
  final bool isLoading;
  const AuthState({
    required this.isLoading,
    required this.errorMessage,
    this.authResonse,
  });

  const AuthState.initial()
    : errorMessage = '',
      authResonse = null,
      isLoading = false;
  AuthState copyWith({
    String? errorMessage,
    AuthEntity? authResonse,
    bool? isLoading,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      authResonse: authResonse ?? this.authResonse,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [errorMessage, authResonse, isLoading];
}
