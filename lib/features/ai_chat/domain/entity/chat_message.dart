import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  // final String id;
  final String content;
  final MessageRole role; // user, assistant, system
  // final DateTime timestamp;

  const ChatMessage({
    // required this.id,
    required this.content,
    required this.role,
    // required this.timestamp,
  });

  @override
  List<Object?> get props => [content, role];
}

enum MessageRole { user, assistant, system }