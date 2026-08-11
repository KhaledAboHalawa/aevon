import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.content,
    required super.role,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      content: json['content'],
      role: MessageRole.values.byName(json['role']),
    );
  }

  Map<String, dynamic> toApiJson() => {
    'role': role.name,
    'content': content,
  };
}