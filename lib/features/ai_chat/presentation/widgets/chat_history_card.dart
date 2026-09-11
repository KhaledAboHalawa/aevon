import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/ai_chat/domain/entity/conversation.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChatHistoryCard extends StatelessWidget {
  const ChatHistoryCard({
    super.key,
    required this.conversation,
    this.onTap,
    required this.index,
  });
  final Conversation conversation;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: true,
        extentRatio: 1 / 6,
        children: [
          SlidableAction(
            spacing: 8,
            borderRadius: BorderRadius.circular(8),
            onPressed: (context) {
              getIt<AiChatCubit>().doIntent(
                DeleteConversationEvent(
                  conversation: conversation,
                  index: index,
                ),
              );
            },
            backgroundColor: AppColors.mainOrange,
            icon: Icons.delete,
          ),
        ],
      ),
      child: GestureDetector(
        behavior: .translucent,
        onTap: () {
          getIt<AiChatCubit>().doIntent(
            ChangeCurrentConversationEvent(conversation: conversation),
          );
          context.pop();
        },
        child: Container(
          height: 35,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.textGrey, width: .5),
            ),
          ),
          child: Row(
            crossAxisAlignment: .start,
            mainAxisAlignment: .spaceBetween,
            children: [
              const Skeleton.keep(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.mainOrange,
                  size: 16,
                ),
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
        ),
      ),
    );
  }
}
