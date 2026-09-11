import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class SetChatOnboardingStateUseCase {
  final ChatRepo repository;
  const SetChatOnboardingStateUseCase(this.repository);

  Future<Result<bool>> call() async {
    return await repository.saveChatOnboardingSeen();
  }
}
