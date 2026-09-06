import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font.dart';

class WorkoutListItem extends StatefulWidget {
  const WorkoutListItem({
    super.key,
    required this.isSelected,
    required this.title,
  });

  final bool isSelected;
  final String title;

  @override
  State<WorkoutListItem> createState() => _WorkoutListItemState();
}

class _WorkoutListItemState extends State<WorkoutListItem> {
  @override
  Widget build(BuildContext context) {
    return widget.isSelected
        ? Container(
            alignment: .center,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.mainOrange,
            ),
            child: Text(
              widget.title,
              style: AppFont.balooThambi2Bold(
                fontSize: 12,
                color: AppColors.white,
              ),
            ),
          )
        : Text(
            widget.title,
            style: AppFont.balooThambi2Bold(
              fontSize: 16,
              color: AppColors.textGrey,
            ),
          );
  }
}
