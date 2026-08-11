import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_header.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_onboarding_bottom_shet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatOnboarding extends StatefulWidget {
  const ChatOnboarding({super.key});

  @override
  State<ChatOnboarding> createState() => _ChatOnboardingState();
}

class _ChatOnboardingState extends State<ChatOnboarding> {
  late final AiChatCubit _aiChatCubit;

  @override
  initState() {
    super.initState();
    _aiChatCubit = getIt<AiChatCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.homeBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          spacing: 8,
          children: [
            const ChatHeader(isInboarding: true, userName: "Aevon"),
            Image.asset(AppImages.robot),
            const ChatOnboardingBottomShet(),
          ],
        ),
      ),
    );
  }
}
