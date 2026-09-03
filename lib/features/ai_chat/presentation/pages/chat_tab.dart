import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/core/shared/presentation/widgets/app_header.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_input.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/messages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> with AutomaticKeepAliveClientMixin {
  late final AiChatCubit _aiChatCubit;
  late final TextEditingController _messageController;
  late final FocusNode _focusNode;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _aiChatCubit = getIt<AiChatCubit>()
      ..doIntent(const StartNewChatEvent())
      ..doIntent(const GetConversationsHistoryEvent());
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
    super.build(context);
    return BlocProvider.value(
      value: _aiChatCubit,
      child: BlocListener<AiChatCubit, AiChatState>(
        listenWhen: (previous, current) {
          if (previous.conversation.messages.length !=
              current.conversation.messages.length) {
            return true;
          }

          if ((previous.conversation.messages.isEmpty) ||
              (current.conversation.messages.isEmpty)) {
            return false;
          }

          if (current.errorMessage != null) return true;

          return previous.conversation.messages.last.content !=
              current.conversation.messages.last.content;
        },
        listener: (BuildContext context, state) {
          handleScroll();
          if (state.errorMessage != null) {
            Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: AppColors.mainOrange,
              textColor: AppColors.white,
              fontSize: 14.0,
            );
          }
        },
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 8),
            const AppHeader(type: .chat, userName: "Aevon"),
            Expanded(child: MessagesList(scrollController: _scrollController)),
            ChatInput(controller: _messageController, focusNode: _focusNode),
          ],
        ),
      ),
    );
  }

  void handleScroll() {
    if (!_isNearBottom) return;
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  bool get _isNearBottom {
    if (!_scrollController.hasClients) {
      return true;
    }

    final position = _scrollController.position;

    return position.maxScrollExtent - position.pixels < 100;
  }

  @override
  bool get wantKeepAlive => true;
}
