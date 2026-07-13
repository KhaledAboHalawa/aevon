import 'package:aevon/features/auth/data/models/auth_request.dart';

sealed class AuthEvent {
  const AuthEvent();

  R when<R>({required R Function({required SignInRequest request}) signIn}) {
    switch (this) {
      case SignInEvent event:
        return signIn(request: event.request);
    }
  }
}

class SignInEvent extends AuthEvent {
  final SignInRequest request;
  const SignInEvent({required this.request});
}
