import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInput extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const ChatInput({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<AiChatCubit, AiChatState, bool>(
      selector: (state) => state.isStreaming,
      builder: (BuildContext context, state) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 4,
          bottom: MediaQuery.of(context).viewInsets.bottom > 200
              ? MediaQuery.of(context).viewInsets.bottom - 100
              : MediaQuery.of(context).padding.bottom,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                onSubmitted: (_) => _sendMessage(context),
                hint: AppLocalizations.of(context)!.askAnything,
                showLableOnTop: false,
                isEnabled: !state,
              ),
            ),
            IconButton(
              onPressed: state ? null : () => _sendMessage(context),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.mainOrange,
                foregroundColor: AppColors.white,
                shape: const CircleBorder(),
                visualDensity: VisualDensity.comfortable,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                disabledForegroundColor: AppColors.lightBlack,
              ),
              icon: const Icon(Icons.send, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final message = widget.controller.text;
    if (message.trim().isEmpty) return;
    context.read<AiChatCubit>().doIntent(SendMessageEvent(message: message));
    widget.controller.clear();
  }
}
