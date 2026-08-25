import 'package:aevon/features/ai_chat/data/model/chat_message_model.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';

class ConversationModel extends Conversation {
  const ConversationModel({
    required super.id,
    required super.title,
    required super.messages,
    required super.createdAt,
    required super.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'messages': messages
          .map(
            (message) => ChatMessageModel(
              content: message.content,
              role: message.role,
            ).toJson(),
          )
          .toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ConversationModel.fromJson(Map<String, dynamic> map) {
    return ConversationModel(
      id: map['id'] as String,
      title: map['title'] as String,
      messages: List<ChatMessageModel>.from(
        (map['messages'] as List<dynamic>).map<ChatMessageModel>(
          (message) =>
              ChatMessageModel.fromJson(message as Map<String, dynamic>),
        ),
      ),
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
    );
  }
}
