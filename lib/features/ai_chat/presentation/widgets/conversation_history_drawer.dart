import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/cubit/base_state.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_history_card.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ConversationHistoryDrawer extends StatefulWidget {
  const ConversationHistoryDrawer({super.key});

  @override
  State<ConversationHistoryDrawer> createState() =>
      _ConversationHistoryDrawerState();
}

class _ConversationHistoryDrawerState extends State<ConversationHistoryDrawer> {
  late final AiChatCubit _aiChatCubit;
  @override
  void initState() {
    super.initState();
    _aiChatCubit = getIt<AiChatCubit>()
      ..doIntent(const GetConversationsHistoryEvent());
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
        bloc: _aiChatCubit,
        buildWhen: (previous, current) =>
            current.getConversationsHistoryState !=
            previous.getConversationsHistoryState,
        builder: (BuildContext context, AiChatState state) {
          final locale = AppLocalizations.of(context)!;
          if (state.getConversationsHistoryState.isLoading &&
              (state.getConversationsHistoryState.data?.isEmpty ?? true)) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state.getConversationsHistoryState.data?.isEmpty ?? true) {
            return Center(
              child: Text(
                locale.noPreviousConversations,
                style: AppFont.balooThambi2SemiBold(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            );
          } else if (state.getConversationsHistoryState.isError) {
            return Center(
              child: Text(
                state.getConversationsHistoryState.error!,
                style: AppFont.balooThambi2SemiBold(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: .end,
              children: [
                Text(
                  locale.previousConversations,
                  style: AppFont.balooThambi2SemiBold(
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: AnimatedList.separated(
                    key: _aiChatCubit.animatedListKey,
                    padding: EdgeInsets.zero,
                    initialItemCount:
                        state.getConversationsHistoryState.data!.length,
                    itemBuilder: (context, index, animation) => ChatHistoryCard(
                      conversation:
                          state.getConversationsHistoryState.data![index],
                      index: index,
                    ),
                    separatorBuilder: (context, index, animation) =>
                        SizeTransition(
                          sizeFactor: animation,
                          child: const SizedBox(height: 8),
                        ),
                    removedSeparatorBuilder:
                        (BuildContext context, int index, animation) =>
                            SizeTransition(
                              sizeFactor: animation,
                              child: const SizedBox(height: 8),
                            ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: CustomButton(
                    isExpanded: true,
                    backgroundColor: AppColors.mainOrange,
                    title: locale.newChat,
                    isLoading: false,
                    onPressed: () {
                      _aiChatCubit.doIntent(const StartNewChatEvent());
                      context.pop();
                    },
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
