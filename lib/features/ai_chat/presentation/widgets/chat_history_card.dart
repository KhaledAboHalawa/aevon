import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatHistoryCard extends StatelessWidget {
  const ChatHistoryCard({super.key, required this.conversation, this.onTap});
  final Conversation conversation;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: .translucent,
      onTap: () {
        getIt<AiChatCubit>().doIntent(
          ChangeCurrentConversation(conversation: conversation),
        );
        context.pop();
      },
      child: SizedBox(
        height: 35,
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.mainOrange,
                  size: 16,
                ),
                Text(
                  conversation.title,
                  style: AppFont.balooThambi2Medium(
                    fontSize: 12,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
            const Divider(color: AppColors.textGrey, thickness: 1),
          ],
        ),
      ),
    );
  }
}
