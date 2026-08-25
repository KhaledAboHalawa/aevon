import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class InitConversationHistoryUseCase {
  final ChatRepo _chatRepo;

  InitConversationHistoryUseCase(this._chatRepo);

  Future<Result<bool>> call({required Conversation conversation}) =>
      _chatRepo.initConversation(conversation: conversation);
}
