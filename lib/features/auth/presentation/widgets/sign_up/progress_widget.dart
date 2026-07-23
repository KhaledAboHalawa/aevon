import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/progress_arc_painter.dart';
import 'package:flutter/material.dart';

class RegistrationProgressArc extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final double size;

  const RegistrationProgressArc({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.size = 220,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return currentStep == 0
        ? const SizedBox.shrink()
        : SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: progress),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) {
                    return CustomPaint(
                      size: Size(size, size),
                      painter: ArcProgressPainter(
                        progress: value,
                        progressColor: const Color(
                          0xFFFF5722,
                        ), // orange from your image
                        backgroundColor: Colors.transparent,
                        strokeWidth: size / 9,
                      ),
                    );
                  },
                ),
                Text(
                  '$currentStep/$totalSteps',
                  style: AppFont.balooThambi2Medium(
                    fontSize: size / 4,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          );
  }
}
