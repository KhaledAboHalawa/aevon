import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_state.dart';
import 'package:aevon/core/shared/presentation/widgets/profile_avatar.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/ai_chat/domain/entity/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({super.key, required this.message});
  final ChatMessage message;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  late final bool isUser;

  @override
  void initState() {
    super.initState();
    isUser = widget.message.role == MessageRole.user;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        textDirection: isUser ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          BlocBuilder<AuthSessionCubit, AuthSessionState>(
            buildWhen: (previous, current) => previous.user?.photo != current.user?.photo,
            builder: (context, state) {
              final user = state.user;
              return ProfileAvatar(
                isUser: isUser,
                imageUrl: isUser ? user?.photo : AppImages.ai,
                initials: isUser
                    ? ((user?.firstName != null && user!.firstName!.isNotEmpty)
                        ? user.firstName![0]
                        : "T")
                    : "AI",
              );
            },
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: isUser ? AppColors.lightOrange : AppColors.lightBlack,
              borderRadius: BorderRadius.only(
                topLeft: isUser
                    ? const Radius.circular(15)
                    : const Radius.circular(0),
                topRight: isUser
                    ? const Radius.circular(0)
                    : const Radius.circular(15),
                bottomLeft: const Radius.circular(15),
                bottomRight: const Radius.circular(15),
              ),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width - 90,
            ),
            child: Text(
              widget.message.content,

              style: AppFont.balooThambi2Regular(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
