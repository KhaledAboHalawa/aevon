import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetConversationsHistoryUseCase {
  final ChatRepo chatRepo;
  GetConversationsHistoryUseCase(this.chatRepo);

  Future<Result<List<Conversation>>> call() => chatRepo.getChatHistory();
}
