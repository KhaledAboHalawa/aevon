import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:aevon/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_events.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_use_case_test.mocks.dart';

@GenerateMocks([SignInUseCase, SignUpUseCase])
void main() {
  late MockSignInUseCase mockSignInUseCase;
  late MockSignUpUseCase mockSignUpUseCase;

  setUp(() {
    mockSignInUseCase = MockSignInUseCase();
    mockSignUpUseCase = MockSignUpUseCase();
  });

  final tRequest = SignInRequest(email: 'test@example.com', password: '123456');
  final tSignInEntity = AuthEntity(
    token: 'abc123',
    user: User(
      firstName: "khaled",
      lastName: "test",
      email: "test@example.com",
      gender: Gender.male,
      age: 21,
      weight: 73,
      height: 173,
    ),
  ); // adjust to your real entity fields

  blocTest<AuthCubit, AuthState>(
    'emits [loading, success] when sign in succeeds',
    build: () {
      when(
        mockSignInUseCase(tRequest),
      ).thenAnswer((_) async => Success(tSignInEntity));
      return AuthCubit(
        signInUseCase: mockSignInUseCase,
        signUpUseCase: mockSignUpUseCase,
      );
    },
    act: (cubit) => cubit.doIntent(SignInEvent(request: tRequest)),
    expect: () => [
      const AuthState.initial().copyWith(isLoading: true),
      const AuthState.initial().copyWith(
        isLoading: false,
        authResonse: tSignInEntity,
      ),
    ],
    verify: (_) {
      verify(mockSignInUseCase(tRequest)).called(1);
    },
  );

  blocTest(
    "emits [loading, error] when sign in fails",
    build: () {
      when(mockSignInUseCase(tRequest)).thenAnswer(
        (_) async => Error(
          Failure(
            message: "error message",
            statusCode: 400,
            success: false,
            status: 400,
          ),
        ),
      );
      return AuthCubit(
        signInUseCase: mockSignInUseCase,
        signUpUseCase: mockSignUpUseCase,
      );
    },
    act: (cubit) => cubit.doIntent(SignInEvent(request: tRequest)),
    expect: () => [
      const AuthState.initial().copyWith(isLoading: true),
      const AuthState.initial().copyWith(
        isLoading: false,
        errorMessage: "error message",
      ),
    ],
    verify: (_) {
      verify(mockSignInUseCase(tRequest)).called(1);
    },
  );
}
