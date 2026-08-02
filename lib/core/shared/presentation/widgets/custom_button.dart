import 'package:aevon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.title,
    this.width,
    required this.isLoading,
  });
  final String title;
  final double? width;
  final bool isLoading;
  final void Function()? onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: width ?? constraints.maxWidth,
        height: 38,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: AppColors.textGrey,
            disabledForegroundColor: AppColors.white,

            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: backgroundColor,
            surfaceTintColor: AppColors.buttonGrey,
            side: (onPressed == null)
                ? null
                : const BorderSide(color: AppColors.mainOrange, width: 1),
          ),
          onPressed: onPressed,
          child: isLoading
              ? const CircularProgressIndicator(
                  constraints: BoxConstraints(minWidth: 25, minHeight: 25),
                  color: AppColors.white,
                  strokeWidth: 3,
                )
              : Text(title),
        ),
      ),
    );
  }
}
