import 'package:aevon/core/network/token_interceptor.dart';
import 'package:aevon/core/shared/auth_session/datasource/local_storage/auth_session.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'token_interceptor_test.mocks.dart';

@GenerateMocks([AuthSession])
void main() {
  late TokenInterceptor tokenInterceptor;
  late MockAuthSession mockAuthSession;

  setUp(() {
    mockAuthSession = MockAuthSession();
    tokenInterceptor = TokenInterceptor(mockAuthSession);
  });

  test('should add token to request headers when token is present', () {
    const testToken = 'test_token_123';
    when(mockAuthSession.getToken()).thenReturn(testToken);

    final options = RequestOptions(path: '/test');
    final handler = RequestInterceptorHandler();

    tokenInterceptor.onRequest(options, handler);

    expect(options.headers[ApiConstants.tokenAuth], equals('Bearer $testToken'));
    verify(mockAuthSession.getToken()).called(1);
  });

  test('should not modify headers when token is null or empty', () {
    when(mockAuthSession.getToken()).thenReturn(null);

    final options = RequestOptions(path: '/test');
    final handler = RequestInterceptorHandler();

    tokenInterceptor.onRequest(options, handler);

    expect(options.headers.containsKey(ApiConstants.tokenAuth), isFalse);
    verify(mockAuthSession.getToken()).called(1);
  });
}
