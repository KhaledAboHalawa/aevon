import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:firebase_ai/firebase_ai.dart';

abstract class ChatRepo {
  Stream<Result<String>> sendMessage({required String message});
  Future<Result<bool>> saveChatOnboardingSeen();
  Result<bool> isChatOnboardingSeen();
  Result<bool> startNewChat({List<Content>? history});
  Future<Result<List<Conversation>>> getChatHistory();
  Future<Result<bool>> saveMessageInHistory({
    required ChatMessage message,
    required String conversationId,
  });
  Future<Result<bool>> initConversation({required Conversation conversation});
}
