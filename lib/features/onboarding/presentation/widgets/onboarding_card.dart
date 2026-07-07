import 'dart:ui';

import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:aevon/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:aevon/features/onboarding/presentation/widgets/nav_section.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatefulWidget {
  const OnboardingCard({super.key, required this.index});
  final int index;
  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
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
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 36, sigmaX: 36),
        child: Container(
          height: 275,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 31.5),
          decoration: BoxDecoration(
            color: AppColors.blur,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.onboardingMessage(widget.index) ??
                    '',
                textAlign: TextAlign.center,
                style: AppFont.balooThambi2ExtraBold(
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)?.onboardingdescription ?? '',
                textAlign: TextAlign.center,
                style: AppFont.balooThambi2Regular(
                  fontSize: 16,
                  color: AppColors.textGrey,
                ),
              ),

              SizedBox(height: 24),
              CustomIndicator(currentPage: widget.index),
              Spacer(),
              NavSection(),
            ],
          ),
        ),
      ),
    );
  }
}
