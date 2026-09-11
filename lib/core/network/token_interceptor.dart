import 'package:aevon/core/shared/auth_session/datasource/local_storage/auth_session.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  final AuthSession _authSession;

  TokenInterceptor(this._authSession);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _authSession.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.tokenAuth] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
