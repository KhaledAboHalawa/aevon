import 'package:aevon/features/forget_password/domain/usecases/forget_password_use_case.dart';
import 'package:aevon/features/forget_password/domain/usecases/reset_password_use_case.dart';
import 'package:aevon/features/forget_password/domain/usecases/verify_code_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

@lazySingleton
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  ForgetPasswordCubit({
    required this.forgetPasswordUseCase,
    required this.resetPasswordUseCase,
    required this.verifyCodeUseCase,
  }) : super(const ForgetPasswordState());

  void doIntent(ForgetPasswordEvent event) => event.when(
    sendEmail: _forgetPassword,
    verifyCode: _verifyCode,
    resetPassword: _resetPassword,
  );

  void _forgetPassword({required String email}) async {
    emit(state.copyWith(isLoading: true));
    final result = await forgetPasswordUseCase(email: email);
    return result.when(
      success: (data) => emit(state.copyWith(email: email, currentPage: 1, isLoading: false)),
      error: (failure) =>
          emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
    );
  }

  void _verifyCode({required String code}) async {
    emit(state.copyWith(isLoading: true));
    final result = await verifyCodeUseCase(code: code);
    return result.when(
      success: (data) => emit(state.copyWith(currentPage: 2, isLoading: false)),
      error: (failure) =>
          emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
    );
  }

  void _resetPassword({required String password}) async {
    emit(state.copyWith(isLoading: true));
    final result = await resetPasswordUseCase(email: state.email, password: password);
    return result.when(
      success: (data) => emit(state.copyWith(isLoading: false)),
      error: (failure) =>
          emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
    );
  }
}
