import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.iconPath,
    required this.title,
    this.titleColor = AppColors.white,
    this.trailing,
    this.showDivider = true,
    this.onTap,
  });

  final String iconPath;
  final String title;
  final Color titleColor;
  final Widget? trailing;
  final bool showDivider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 32,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: showDivider
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderDark),
                  ),
                )
              : null,
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: const .mode(AppColors.mainOrange, .srcIn),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: AppFont.balooThambi2SemiBold(
                    color: titleColor,
                    fontSize: 14,
                  ),
                ),
              ),
              trailing ??
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.mainOrange,
                    size: 20,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
