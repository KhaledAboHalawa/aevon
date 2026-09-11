import 'dart:isolate';

import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetConversationsHistoryUseCase {
  final ChatRepo chatRepo;
  GetConversationsHistoryUseCase(this.chatRepo);

  Future<Result<List<Conversation>>> call() async {
    return await chatRepo.getChatHistory();
    // return result.when(
    //   success: (data) async =>
    //       Success(await sortConversationsByCreatedAt(data)),
    //   error: (error) => Error(error),
    // );
  }

  Future<List<Conversation>> sortConversationsByCreatedAt(
    List<Conversation> conversations,
  ) {
    return Isolate.run(() {
      final sorted = List<Conversation>.from(conversations);
      sorted.sort(
        (a, b) => b.updatedAt!.compareTo(a.updatedAt!),
      ); // newest first
      return sorted;
    });
  }
}
