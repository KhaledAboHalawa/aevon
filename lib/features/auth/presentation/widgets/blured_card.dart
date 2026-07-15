import 'dart:ui';

import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BluredCard extends StatefulWidget {
  const BluredCard({super.key, required this.children});
  final List<Widget> children;
  @override
  State<BluredCard> createState() => _BluredCardState();
}

class _BluredCardState extends State<BluredCard> {
  bool isFirstLoad = true;
  late AppLocalizations locale;
  late OnboardingCubit onboardingCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      onboardingCubit = getIt<OnboardingCubit>();
      locale = AppLocalizations.of(context)!;
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
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          decoration: const BoxDecoration(
            color: AppColors.blur,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}
