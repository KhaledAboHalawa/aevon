import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.title,
    this.width,
    required this.isLoading, this.isExpanded = false,
  });
  final String title;
  final double? width;
  final bool isLoading;
  final bool isExpanded;
  final void Function()? onPressed;
  final Color backgroundColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _measureContentWidth(BuildContext context) {
    final textStyle = AppFont.balooThambi2ExtraBold(
      fontSize: 14,
      color: AppColors.buttonGrey,
    );

    final painter = TextPainter(
      text: TextSpan(text: widget.title, style: textStyle),
      textDirection: Directionality.of(context),
      maxLines: 1,
    )..layout();

    return painter.width + 50;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width:
                (widget.width) ??
                (widget.isExpanded
                    ? constraints.maxWidth
                    : _measureContentWidth(context)),
            decoration: BoxDecoration(
              color: AppColors.mainOrange,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                widget.title,
                key: ValueKey(
                  widget.title,
                ), // needed so AnimatedSwitcher detects the change
                overflow: TextOverflow.ellipsis,
                style: AppFont.balooThambi2ExtraBold(
                  fontSize: 14,
                  color: AppColors.buttonGrey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
