import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.imageUrl, this.initials});
  final String? imageUrl;
  final String? initials;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.mainOrange),
        child: imageUrl != null
            ? CachedNetworkImage(
                fit: BoxFit.contain,
                width: 35,
                height: 35,
                imageUrl: imageUrl!,
                placeholder: (context, url) => Center(
                  child: Text(
                    initials ?? '',
                    style: AppFont.balooThambi2Bold(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Center(
                    child: Text(
                      initials ?? '',
                      textAlign: TextAlign.center,
                      style: AppFont.balooThambi2Medium(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(
                width: 35,
                height: 35,
                child: Center(
                  child: Text(
                    initials ?? '',
                    textAlign: TextAlign.center,
                    style: AppFont.balooThambi2Medium(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
