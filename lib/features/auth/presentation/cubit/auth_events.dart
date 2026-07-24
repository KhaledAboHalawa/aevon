import 'package:aevon/features/auth/data/models/auth_request.dart';

sealed class AuthEvent {
  const AuthEvent();

  R when<R>({
    required R Function({required SignInRequest request}) signIn,
    required R Function() signUp,
  }) {
    switch (this) {
      case SignInEvent event:
        return signIn(request: event.request);
      case SignUpEvent _:
        return signUp();
    }
  }
}

class SignInEvent extends AuthEvent {
  final SignInRequest request;
  const SignInEvent({required this.request});
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent();
}
