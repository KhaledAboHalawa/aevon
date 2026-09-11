import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'typing_bubble.dart';

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
      builder: (context, state) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          dragStartBehavior: .start,
          keyboardDismissBehavior: .manual,
          controller: widget.scrollController,
          itemCount:
              state.conversation.messages.length +
              ((state.waitingForResponse) ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < state.conversation.messages.length) {
              final message = state.conversation.messages[index];
              return MessageBubble(message: message);
            }
            return const TypingBubble();
          },
        ),
      ),
    );
  }
}
