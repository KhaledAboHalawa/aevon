import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_history_card.dart';
import 'package:flutter/material.dart';

class AiChatDrawer extends StatelessWidget {
  const AiChatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightBlack,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      width: MediaQuery.sizeOf(context).width * .7,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: .end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Previous Conversations',
                style: AppFont.balooThambi2SemiBold(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const ChatHistoryCard(title: 'Item 1'),
                  const ChatHistoryCard(title: 'Item 2'),
                  const ChatHistoryCard(title: 'Item 2'),
                  const ChatHistoryCard(title: 'Item 1'),
                  const ChatHistoryCard(title: 'Item 2'),
                  const ChatHistoryCard(title: "Item 2"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
