import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/datasource/auth_data_source.dart';
import 'package:aevon/features/auth/data/mapper/auth_response_mapper.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/data/models/auth_respons.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aevon/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../datasource/auth_data_source_impl_test.mocks.dart';
import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthDataSource])
void main() {
  late MockAuthDataSource authDataSourceMock;
  late MockAuthSession mockAuthSession;
  late AuthRepoImpl authRepoImpl;
  late SignInRequest tRequest;
  late AuthResonse tResponse;
  setUpAll(() {
    authDataSourceMock = MockAuthDataSource();
    mockAuthSession = MockAuthSession();
    authRepoImpl = AuthRepoImpl(authDataSourceMock,mockAuthSession);
    tRequest = SignInRequest(email: 'test@gmail.com', password: 'Test123');
    tResponse = AuthResonse(
      token: 'token',
      message: "message",
      user: User(
        firstName: "khaled",
        lastName: "test",
        email: "test@gmail.com",
        gender: Gender.male,
        age: 21,
        weight: 73,
        height: 173,
      ),
    );
  });
  test('Success with parsed SignInResonse when call succeeds', () async {
    // arrange

    when(
      authDataSourceMock.singInWithREST(tRequest),
    ).thenAnswer((_) async => Success(tResponse));
    // act
    final result = await authRepoImpl.singInWithREST(tRequest);
    // assert
    expect(result, isA<Success<AuthEntity>>());

    result.when(
      success: (data) {
        expect(data, tResponse.toSignInEntity());
      },
      error: (failure) {},
    );
  });

  test("test error case", () async {
    // arrange
    when(authDataSourceMock.singInWithREST(tRequest)).thenAnswer(
      (_) async => Error(
        Failure(
          message: "this is test error",
          statusCode: 401,
          success: false,
          status: 401,
        ),
      ),
    );
    // act
    final result = await authRepoImpl.singInWithREST(tRequest);
    // assert
    expect(result, isA<Error<AuthEntity>>());

    result.when(
      success: (data) {},
      error: (failure) {
        expect(failure.message, "this is test error");
      },
    );
  });
}
