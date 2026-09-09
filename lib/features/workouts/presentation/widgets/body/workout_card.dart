import 'package:aevon/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: .bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: .bottomCenter,
            foregroundDecoration: const BoxDecoration(
              color: Color.fromARGB(130, 36, 36, 36),
            ),
            child: Image.asset(
              AppImages.test,
              fit: BoxFit.cover,
              cacheWidth: 180,
              cacheHeight: 180,
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          width: 138,
          child: Text(
            'Workout Card Item',
            maxLines: 2,
            textAlign: .center,
            style: AppFont.balooThambi2Bold(
              fontSize: 16,
              color: AppColors.white,
            ).copyWith(height: 1),
          ),
        ),
      ],
    );
  }
}
