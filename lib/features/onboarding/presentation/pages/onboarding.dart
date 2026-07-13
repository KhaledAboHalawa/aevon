import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onBoardingBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: OnboardingBody(),
        ),
      ),
    );
  }
}
