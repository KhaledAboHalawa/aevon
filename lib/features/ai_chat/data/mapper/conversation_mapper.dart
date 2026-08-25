import 'package:aevon/features/ai_chat/data/model/chat_message_model.dart';
import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:firebase_ai/firebase_ai.dart';

extension ConversationMapper on List<ChatMessageModel> {
  List<Content> toModelMessages() {
    return map((e) {
      switch (e.role) {
        case MessageRole.assistant:
          return Content.model([TextPart(e.content)]);
        case MessageRole.user:
          return Content.text(e.content);
        case MessageRole.system:
          return Content.text(e.content);
      }
    }).toList();
  }
}
