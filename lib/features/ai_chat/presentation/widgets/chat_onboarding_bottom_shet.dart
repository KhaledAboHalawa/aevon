import 'dart:ui';

import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatOnboardingBottomShet extends StatefulWidget {
  const ChatOnboardingBottomShet({super.key});
  @override
  State<ChatOnboardingBottomShet> createState() =>
      _ChatOnboardingBottomShetState();
}

class _ChatOnboardingBottomShetState extends State<ChatOnboardingBottomShet> {
  late final AiChatCubit cubit;
  bool isFirstLoad = true;
  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context)!;
      cubit = getIt<AiChatCubit>();
      isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 36, sigmaX: 36),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 32.5, vertical: 40),
          decoration: const BoxDecoration(
            color: AppColors.blur,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 8,
            children: [
              Text(
                locale.chatOnboardingBottomSheetTitle,
                textAlign: TextAlign.center,
                style: AppFont.balooThambi2ExtraBold(
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),
              CustomButton(
                backgroundColor: AppColors.mainOrange,
                title: locale.getStarted,
                isLoading: false,
                onPressed: () {
                  cubit.doIntent(const OnBoardingSeenEvent());
                  context.pop(false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
