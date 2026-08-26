import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:flutter/material.dart';

class ChatHistoryCard extends StatelessWidget {
  const ChatHistoryCard({super.key, required this.conversation, this.onTap});
  final Conversation conversation;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 45,
        child: Column(
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
