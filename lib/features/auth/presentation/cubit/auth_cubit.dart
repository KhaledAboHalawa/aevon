import 'dart:developer';

import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/usecases/fetch_user_info_use_case.dart';
import 'package:aevon/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:aevon/features/auth/domain/usecases/sign_up_use_case.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final FetchUserInfoUseCase fetchUserInfoUseCase;
  SignUpRequest signUpRequest;
  AuthCubit({
    required this._signInUseCase,
    required this._signUpUseCase,
    required this.fetchUserInfoUseCase,
  }) : signUpRequest = SignUpRequest(),
       super(const AuthState.initial()) {
    fetchUserInfo();
  }

  void doIntent(AuthEvent event) {
    event.when(signIn: _signIn, signUp: _signUp);
  }

  void fetchUserInfo() {
    final result = fetchUserInfoUseCase();
    result.when(
      success: (data) => emit(
        state.copyWith(
          authResonse: AuthEntity(token: '', user: data),
        ),
      ),
      error: (failure) => emit(state.copyWith(errorMessage: failure.message)),
    );
  }

  void _signIn({required SignInRequest request}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _signInUseCase(request);
    return result.when(
      success: (data) =>
          emit(state.copyWith(authResonse: data, isLoading: false)),
      error: (failure) =>
          emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
    );
  }

  void _signUp() async {
    emit(state.copyWith(isLoading: true));
    final result = await _signUpUseCase(signUpRequest);
    return result.when(
      success: (data) {
        log(data.toString());
        emit(state.copyWith(authResonse: data, isLoading: false));
      },
      error: (failure) {
        log(failure.message);
        emit(state.copyWith(errorMessage: failure.message, isLoading: false));
      },
    );
  }
}
