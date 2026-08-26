import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationHistoryDrawer extends StatefulWidget {
  const ConversationHistoryDrawer({super.key});

  @override
  State<ConversationHistoryDrawer> createState() =>
      _ConversationHistoryDrawerState();
}

class _ConversationHistoryDrawerState extends State<ConversationHistoryDrawer> {
  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    getIt<AiChatCubit>().doIntent(const GetConversationsHistoryEvent());
  }

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
      child: BlocBuilder<AiChatCubit, AiChatState>(
        bloc: getIt<AiChatCubit>(),
        builder: (BuildContext context, AiChatState state) {
          if (state.conversatoinsHistoryisLoading &&
              state.conversationsHistory.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state.conversationsHistory.isEmpty) {
            return Center(
              child: Text(
                'No Previous Conversations',
                style: AppFont.balooThambi2SemiBold(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            );
          }else if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: AppFont.balooThambi2SemiBold(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            );
          }
          return Padding(
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
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.conversationsHistory.length,
                    itemBuilder: (context, index) => ChatHistoryCard(
                      conversation: state.conversationsHistory[index],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
