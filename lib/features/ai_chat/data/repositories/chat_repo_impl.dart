import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/data/datasources/chat_history_data_source.dart';
import 'package:aevon/features/ai_chat/data/datasources/chat_local_data_source.dart';
import 'package:aevon/features/ai_chat/data/datasources/chat_remote_data_source.dart';
import 'package:aevon/features/ai_chat/data/model/chat_message_model.dart';
import 'package:aevon/features/ai_chat/data/model/conversation_model.dart';
import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ChatRepo)
class ChatRepoImpl implements ChatRepo {
  final ChatLocalDataSource _localDataSource;
  final ChatRemoteDataSource _remoteDataSource;
  final ChatHistoryDataSource _chatHistoryDataSource;
  const ChatRepoImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._chatHistoryDataSource,
  );

  @override
  Future<Result<bool>> saveChatOnboardingSeen() {
    return _localDataSource.chatOnboardingSeen();
  }

  @override
  Result<bool> isChatOnboardingSeen() {
    return _localDataSource.checkChatOnboardingSeen();
  }

  @override
  Stream<Result<String>> sendMessage({required String message}) {
    return _remoteDataSource.sendMessage(message: message);
  }

  @override
  Result<bool> startNewChat() {
    return _remoteDataSource.startNewChat();
  }

  @override
  Future<Result<List<Conversation>>> getChatHistory() {
    return _chatHistoryDataSource.getChatHistory();
  }

  @override
  Future<Result<bool>> saveMessageInHistory({
    required ChatMessage message,
    required String conversationId,
  }) {
    return _chatHistoryDataSource.saveChatHistory(
      message: ChatMessageModel(
        content: message.content,
        role: message.role,
        id: message.id,
      ),
      conversationId: conversationId,
    );
  }

  @override
  Future<Result<bool>> initConversation({required Conversation conversation}) =>
      _chatHistoryDataSource.initConversationCollection(
        conversation: ConversationModel.fromEntity(conversation),
      );
}
