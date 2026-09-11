import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetChatOnboardingStateUseCase {
  final ChatRepo repository;
  const GetChatOnboardingStateUseCase(this.repository);

  Result<bool> call() {
    return repository.isChatOnboardingSeen();
  }
}
