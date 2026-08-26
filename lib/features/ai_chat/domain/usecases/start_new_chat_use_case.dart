import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:injectable/injectable.dart';

@singleton
class StartNewChatUseCase {
  final ChatRepo chatRepo;
  StartNewChatUseCase(this.chatRepo);
  Result<bool> call({List<Content>? history}) => chatRepo.startNewChat(history: history);
}
