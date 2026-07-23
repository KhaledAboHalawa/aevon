import 'package:aevon/core/theme/app_colors.dart';
// ignore: unused_import
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key,
    required this.isSelected,
    required this.gender,
    required this.onPressed,
  });
  final bool isSelected;
  final Gender gender;
  final void Function(Gender g) onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(gender);
      },
      child: Container(
        height: 95,
        width: 95,
        padding: const EdgeInsets.all(9.45),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainOrange : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.mainOrange : AppColors.white,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              height: 51,
              gender == Gender.male ? AppIcons.male : AppIcons.female,
            ),
            Text(
              gender.name,
              style: AppFont.balooThambi2SemiBold(
                color: AppColors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
