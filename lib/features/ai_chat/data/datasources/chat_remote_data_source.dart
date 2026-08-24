import 'package:aevon/core/shared/data/model/result.dart';

abstract class ChatRemoteDataSource {
  Stream<Result<String>> sendMessage({
    required String message,
  });
  Result<bool> startNewChat();
}
