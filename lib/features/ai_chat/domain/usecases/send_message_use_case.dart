import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendMessageUseCase {
  final ChatRepo repository;

  SendMessageUseCase({
    required this.repository,
  });

  Stream<Result<String>> call({
    required String message,
  }) {
    return repository.sendMessage(
      message: message,
    );
  }
}