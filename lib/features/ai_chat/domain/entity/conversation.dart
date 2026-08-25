import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:equatable/equatable.dart';

class Conversation extends Equatable {
  final String id;
  final String title;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ChatMessage> messages;

  Conversation.empty()
    : this(id: 'in empty 03', title: 'conversation3 in empty', createdAt: null, updatedAt: null, messages: []);

  const Conversation({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
  });

  Conversation copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ChatMessage>? messages,
  }) {
    return Conversation(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object?> get props => [id, title, createdAt, updatedAt, messages];
}
