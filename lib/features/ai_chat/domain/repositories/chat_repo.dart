import 'package:aevon/core/shared/data/model/result.dart';

abstract class ChatRepo {
  Stream<Result<String>> sendMessage({
    required String message,
  });
  Future<Result<bool>> saveChatOnboardingSeen();
  Result<bool> isChatOnboardingSeen();
}