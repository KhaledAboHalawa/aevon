import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_header.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_input.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/messages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  late final TextEditingController _messageController;
  late final FocusNode _focusNode;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _messageController = TextEditingController();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AiChatCubit>(),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top+8),
          const ChatHeader(isInboarding: false, userName: "Aevon"),
          Expanded(child: MessagesList(scrollController: _scrollController)),
          ChatInput(controller: _messageController, focusNode: _focusNode),
        ],
      ),
    );
  }
}
