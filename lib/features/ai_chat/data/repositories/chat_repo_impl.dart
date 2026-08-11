import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/data/datasources/chat_local_data_source.dart';
import 'package:aevon/features/ai_chat/data/datasources/chat_remote_data_source.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ChatRepo)
class ChatRepoImpl implements ChatRepo {
  final ChatLocalDataSource _localDataSource;
  final ChatRemoteDataSource _remoteDataSource;
  const ChatRepoImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Result<bool>> saveChatOnboardingSeen() {
    return _localDataSource.chatOnboardingSeen();
  }

  @override
  Result<bool> isChatOnboardingSeen() {
    return _localDataSource.checkChatOnboardingSeen();
  }

  @override
  Stream<Result<String>> sendMessage({
    required String message,
  }) {
    return _remoteDataSource.sendMessage(message: message);
  }
}
