import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const ChatInput({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      
      child: BlocSelector<AiChatCubit, AiChatState, bool>(
        selector: (state) => state.isStreaming,
        builder: (BuildContext context, state) => Padding(
          padding: const EdgeInsets.only(left: 16, right: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller,
                  focusNode: focusNode,
                  onSubmitted: (_) => _sendMessage(context),
                  hint: 'Ask anything',
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
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final message = controller.text;
    // if (message.trim().isEmpty) return;
    context.read<AiChatCubit>().sendMessage(message: message);
    controller.clear();
  }
}
