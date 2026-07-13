import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase _signInUseCase;
  AuthCubit({required this._signInUseCase}) : super(const AuthState.initial());

  void doIntent(AuthEvent event) {
    event.when(signIn: _signIn);
  }

  void _signIn({required SignInRequest request}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _signInUseCase(request);
    return result.when(
      success: (data) => emit(state.copyWith(signInResonse: data, isLoading: false)),
      error: (failure) => emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
    );
  }
}
