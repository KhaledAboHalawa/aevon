import 'dart:ui';

import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class FitnessBackground extends StatelessWidget {
  const FitnessBackground({
    super.key,
    required this.child,
    this.backgroundImage = AppImages.homeBG,
  });

  final Widget child;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffoldDark,
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.25, sigmaY: 6.25),
            child: Container(color: AppColors.darkOverlay),
          ),
          child,
        ],
      ),
    );
  }
}
