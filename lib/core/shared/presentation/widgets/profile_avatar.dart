import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.isUser = true,
    this.width = 29,
  });
  final String? imageUrl;
  final String? initials;
  final bool isUser;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final memCacheWidth = (width ?? 29 * MediaQuery.devicePixelRatioOf(context))
        .round();
    return ClipOval(
      child: imageUrl != null
          ? isUser
                ? CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: width ?? 29,
                    height: width ?? 29,
                    imageUrl: imageUrl!,
                    memCacheWidth: memCacheWidth,
                    placeholder: (context, url) => Center(
                      child: Text(
                        initials ?? '',
                        style: AppFont.balooThambi2Bold(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.mainOrange,
                      ),
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
                : Image.asset(
                    imageUrl!,
                    width: width ?? 29,
                    height: width ?? 29,
                    cacheWidth: memCacheWidth,
                  )
          : Container(
              width: width ?? 29,
              height: width ?? 29,
              alignment: .center,
              decoration: const BoxDecoration(color: AppColors.mainOrange),
              child: Text(
                initials ?? '',
                textAlign: TextAlign.center,
                style: AppFont.balooThambi2Medium(
                  color: AppColors.white,
                  fontSize: 18,
                ),
              ),
            ),
    );
  }
}
