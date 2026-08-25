import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.content,
    required super.role,
    required super.id,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      content: json['content'],
      role: MessageRole.values.byName(json['role']),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {'role': role.name, 'content': content, 'id': id};
}
