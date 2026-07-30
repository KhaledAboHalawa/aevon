import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustmoNavBarItem extends StatelessWidget {
  const CustmoNavBarItem({
    super.key,
    required this.iconPath,
    required this.selected,
    required this.index,
    required this.onTap,
    required this.title,
  });
  final String title;
  final String iconPath;
  final bool selected;
  final int index;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              HapticFeedback.selectionClick();
              onTap(index);
            },
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.mainOrange : AppColors.textGrey,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 4),
          AnimatedCrossFade(
            firstChild: Text(
              title,
              style: AppFont.balooThambi2Regular(
                color: AppColors.mainOrange,
                fontSize: 12,
              ),
            ),
            secondChild: const SizedBox.shrink(),
            crossFadeState: selected
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}