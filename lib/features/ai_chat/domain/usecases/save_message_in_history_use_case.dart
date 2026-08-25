import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class SaveMessageInHistoryUseCase {
  final ChatRepo chatRepo;
  SaveMessageInHistoryUseCase(this.chatRepo);

  Future<Result<bool>> call({
    required ChatMessage message,
    required String conversationId,
  }) =>
      chatRepo.saveMessageInHistory(message: message, conversationId: conversationId);
}