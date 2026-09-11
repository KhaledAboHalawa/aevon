import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:dio/dio.dart';

Future<Result<T>> executeApiCall<T>({
  required Future<Response<Map<String, dynamic>>> Function() apiCall,
  required T Function(Map<String, dynamic> data) parser,
}) async {
  try {
    final result = await apiCall();
    return Success<T>(parser(result.data ?? {}));
  } catch (e) {
    return Error<T>(ErrorHandler.handle(e).failure);
  }
}
