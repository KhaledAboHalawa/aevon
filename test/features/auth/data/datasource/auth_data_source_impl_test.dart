import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/auth/data/datasource/auth_data_source_impl.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/data/models/auth_respons.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late AuthDataSourceImpl authDataSourceImpl;

  setUp(() {
    mockDio = MockDio();
    authDataSourceImpl = AuthDataSourceImpl(mockDio);
  });

  final tRequest = SignInRequest(email: 'test@gmail.com', password: 'Test123');
  final tResponse = SignInResonse(
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

  test(
    'should return Success with parsed SignInResonse when call succeeds',
    () async {
      // arrange
      when(
        //we can replace ApiConstants.signIn with any.     we can use trequest.toJson() instead
        mockDio.post(
          ApiConstants.signIn,
          data: anyNamed('data'),
        ), // we use anyNamed('data') to pass any data to named parameter
      ).thenAnswer(
        (_) async => Response(
          data: tResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: ApiConstants.signIn),
        ),
      );

      // act
      final result = await authDataSourceImpl.singInWithREST(tRequest);

      // assert
      expect(result, isA<Result<SignInResonse>>());
      result.when(
        success: (response) {
          expect(response, isA<SignInResonse>());
        },
        error: (_) => {},
      );
    },
  );

  group("failure tests", () {
    test("test the error case", () async {
      // arrange
      when(mockDio.post(ApiConstants.signIn, data: anyNamed('data'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ApiConstants.signIn),
          type: DioExceptionType.unknown,
        ),
      );

      // act
      final result = await authDataSourceImpl.singInWithREST(tRequest);

      // assert
      expect(result, isA<Result<SignInResonse>>());
      result.when(
        success: (_) => {},
        error: (error) {
          expect(error, isA<Failure>());
          expect(error.message, "An unexpected error occurred.");
        },
      );
    });

    test("test the error case", () async {
      // arrange
      when(mockDio.post(ApiConstants.signIn, data: anyNamed('data'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ApiConstants.signIn),

          type: DioExceptionType.badResponse,
        ),
      );

      // act
      final result = await authDataSourceImpl.singInWithREST(tRequest);

      // assert
      expect(result, isA<Result<SignInResonse>>());
      result.when(
        success: (_) => {},
        error: (error) {
          expect(error, isA<Failure>());
          expect(error.message, "Bad request. Please check your input.");
        },
      );
    });
  });
}
