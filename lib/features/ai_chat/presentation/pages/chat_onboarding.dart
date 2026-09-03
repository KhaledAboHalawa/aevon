import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/core/shared/presentation/widgets/app_header.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_onboarding_bottom_shet.dart';
import 'package:flutter/material.dart';

class ChatOnboarding extends StatefulWidget {
  const ChatOnboarding({super.key});

  @override
  State<ChatOnboarding> createState() => _ChatOnboardingState();
}

class _ChatOnboardingState extends State<ChatOnboarding> {
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
            const AppHeader(type: .chatOnboarding, userName: "Aevon"),
            Image.asset(AppImages.robot),
            const ChatOnboardingBottomShet(),
          ],
        ),
      ),
    );
  }
}
