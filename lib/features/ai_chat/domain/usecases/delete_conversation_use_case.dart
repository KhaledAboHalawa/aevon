import 'package:injectable/injectable.dart';

import '../../../../core/shared/data/model/result.dart';
import '../entity/conversation.dart';
import '../repositories/chat_repo.dart';

@lazySingleton
class DeleteConversationUseCase {
  final ChatRepo _chatRepo;
  DeleteConversationUseCase(this._chatRepo);

  Future<Result<bool>> call({required Conversation conversation}) async =>
      await _chatRepo.deleteChatHistory(conversation: conversation);
}
