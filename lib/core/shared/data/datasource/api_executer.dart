import 'dart:developer';

import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';

Future<Result<T>> executeApiCall<T>({
  required Future Function() apiCall,
  required T Function(dynamic data) parser,
}) async {
  try {
    final result = await apiCall();
    return Success<T>(parser(result.data));
  } catch (e) {
    log(e.toString());
    return Error<T>(ErrorHandler.handle(e).failure);
  }
}
