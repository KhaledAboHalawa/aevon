import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/core/shared/presentation/widgets/app_header.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/chat_onboarding_bottom_shet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/auth_session/presentation/cubit/auth_session_state.dart';

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
            BlocBuilder<AuthSessionCubit, AuthSessionState>(
              buildWhen: (previous, current) =>
                  previous.user?.firstName != current.user?.firstName,
              builder: (context, state) {
                return AppHeader(
                  type: .chatOnboarding,
                  userName: state.user?.firstName ?? "",
                );
              },
            ),
            Image.asset(AppImages.robot),
            const ChatOnboardingBottomShet(),
          ],
        ),
      ),
    );
  }
}
