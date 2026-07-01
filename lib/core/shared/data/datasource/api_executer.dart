import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';

class ApiExecuter {
  ApiExecuter();

  Future<Result<T>> executeApiCall<T>({
    required Future Function() apiCall,
    required T Function(dynamic data) parser,
  }) async {
    try {
      final result = await apiCall();
      
      return Success<T>(parser(result));
    } catch (e) {
      return Error<T>(e);
    }
  }
}
