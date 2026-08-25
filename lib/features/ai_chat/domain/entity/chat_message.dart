import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String id;
  final String content;
  final MessageRole role;

  const ChatMessage({
    required this.content,
    required this.role,
    required this.id,
  });

  @override
  List<Object?> get props => [content, role];
}

enum MessageRole { user, assistant, system }
