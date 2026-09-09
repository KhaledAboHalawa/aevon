import 'package:aevon/core/localization/localization_cubit.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalizatonInterceptor extends Interceptor {
  final LocalizationCubit _localizationCubit;

  LocalizatonInterceptor(this._localizationCubit);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final languageCode = _localizationCubit.state.languageCode; 
    if (languageCode.isNotEmpty) {
      options.headers[ApiConstants.responseLang] = languageCode;
    }
    super.onRequest(options, handler);
  }
}
