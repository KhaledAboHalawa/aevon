import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onboardingBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 204, 145, 145),
        body: OnboardingBody(),
      ),
    );
  }
}
