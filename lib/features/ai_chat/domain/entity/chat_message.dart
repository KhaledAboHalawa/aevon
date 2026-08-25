import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String content;
  final MessageRole role;

  const ChatMessage({
    required this.content,
    required this.role,
  });

  @override
  List<Object?> get props => [content, role];
}

enum MessageRole { user, assistant, system }