import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';

class CheckCard extends StatelessWidget {
  const CheckCard({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.textGrey.withAlpha(51),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.buttonGrey, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppFont.balooThambi2Bold(
                  fontSize: 12,
                  color: AppColors.textGrey,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.textGrey, width: 1.5),
                ),
                child: isSelected
                    ? Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainOrange,
                      ),
                    )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
