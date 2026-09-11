import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String id;
  final String content;
  final MessageRole role;
  final bool isActive;

  const ChatMessage({
    required this.content,
    required this.role,
    required this.id,
    this.isActive = false,
  });

  @override
  List<Object?> get props => [content, role, isActive];

  ChatMessage copyWith({String? content, MessageRole? role, bool? isActive}) {
    return ChatMessage(
      content: content ?? this.content,
      role: role ?? this.role,
      id: id,
      isActive: isActive ?? this.isActive,
    );
  }
}

enum MessageRole { user, assistant, system }
