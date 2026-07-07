import 'package:aevon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.title,
    this.width,
  });
  final String title;
  final double? width;
  final void Function()? onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: backgroundColor,
        surfaceTintColor: AppColors.buttonGrey,
        side: BorderSide(color: AppColors.mainOrange, width: 1),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
