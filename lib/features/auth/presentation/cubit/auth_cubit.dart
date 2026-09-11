
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:aevon/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final AuthSessionCubit authSessionCubit;
  SignUpRequest signUpRequest;

  AuthCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.authSessionCubit,
  })  : signUpRequest = SignUpRequest(),
        super(const AuthState.initial());

  void doIntent(AuthEvent event) {
    event.when(signIn: _signIn, signUp: _signUp);
  }

  void _signIn({required SignInRequest request}) async {
    emit(state.copyWith(isLoading: true));
    final result = await signInUseCase(request);
    return result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(state.copyWith(authResonse: data, isLoading: false));
      },
      error: (failure) =>
          emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
    );
  }

  void _signUp() async {
    emit(state.copyWith(isLoading: true));
    final result = await signUpUseCase(signUpRequest);
    return result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(state.copyWith(authResonse: data, isLoading: false));
      },
      error: (failure) {
        emit(state.copyWith(errorMessage: failure.message, isLoading: false));
      },
    );
  }
}

