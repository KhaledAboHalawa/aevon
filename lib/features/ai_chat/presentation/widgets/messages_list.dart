import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatCubit, AiChatState>(
      builder: (context, state) => ListView.builder(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        dragStartBehavior: .down,
        controller: widget.scrollController,
        itemCount: state.conversation.messages.length,
        itemBuilder: (context, index) {
          final message = state.conversation.messages[index];
          return MessageBubble(message: message);
        },
      ),
    );
  }
}
