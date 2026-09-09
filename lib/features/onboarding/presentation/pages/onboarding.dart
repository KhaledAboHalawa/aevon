import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/presentation/widgets/app_scafolled.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
      child: const AppScaffold(
        body: OnboardingBody(),
      ),
    );
  }
}
