import 'package:aevon/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SlidShowSection extends StatelessWidget {
  const SlidShowSection({super.key, required this.currentPage});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Image.asset(
          key: UniqueKey(),
          AppImages.onBoardingSlides[currentPage],
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
