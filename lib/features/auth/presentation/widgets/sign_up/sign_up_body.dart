import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/progress_widget.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/sign_up_slider.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  int index = 0;
  bool isFirstLoad = true;
  late AppLocalizations locale;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context)!;
      isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.logo, width: 70, height: 48),
        const SizedBox(height: 34),
        if (index != 0)
          const RegistrationProgressArc(
            currentStep: 1,
            totalSteps: 6,
            size: 40,
          ),
        const SignUpSlider(),
      ],
    );
  }
}
