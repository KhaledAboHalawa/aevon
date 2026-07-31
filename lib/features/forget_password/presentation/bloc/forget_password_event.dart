part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  void when({
    required Function({required String email}) sendEmail,
    required Function({required String code}) verifyCode,
    required Function({required String email, required String password})
    resetPassword,
  }) {
    switch (this) {
      case ForgetPasswordEventSendEmail event:
        sendEmail(email: event.email);
      case ForgetPasswordEventVerifyCode event:
        verifyCode(code: event.code);
      case ForgetPasswordEventResetPassword event:
        resetPassword(email: event.email, password: event.password);
    }
  }

  @override
  List<Object> get props => [];
}

class ForgetPasswordEventSendEmail extends ForgetPasswordEvent {
  final String email;
  const ForgetPasswordEventSendEmail({required this.email});
  @override
  List<Object> get props => [email];
}

class ForgetPasswordEventVerifyCode extends ForgetPasswordEvent {
  final String code;
  const ForgetPasswordEventVerifyCode({required this.code});
  @override
  List<Object> get props => [code];
}

class ForgetPasswordEventResetPassword extends ForgetPasswordEvent {
  final String email;
  final String password;
  const ForgetPasswordEventResetPassword({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
