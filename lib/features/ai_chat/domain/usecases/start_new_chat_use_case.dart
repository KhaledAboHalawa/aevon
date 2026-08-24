import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class StartNewChatUseCase {
  final ChatRepo chatRepo;
  StartNewChatUseCase(this.chatRepo);
  Result<bool> call() => chatRepo.createNewChat();
}
