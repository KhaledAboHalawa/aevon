import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/user_info_field.dart';
import 'package:flutter/material.dart';

void showEditFieldDialog(
  BuildContext context, {
  required EditProfileField field,
  required Widget fieldWidget,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      buttonPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: const Color.fromARGB(180, 26, 26, 26),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            field.getTitle(context),
            style: AppFont.balooThambi2Bold(
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: fieldWidget,
      ),
    ),
  );
}
