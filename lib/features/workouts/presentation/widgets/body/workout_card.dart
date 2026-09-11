import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/workouts/domain/entity/prime_mover_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key, required this.entity});
  final PrimeMoverEntity entity;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageWidth = (screenWidth - 24) / 2;
    final memCacheWidth =
        (imageWidth * MediaQuery.devicePixelRatioOf(context) * .9).round();
    return Stack(
      fit: StackFit.expand,
      alignment: .bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            foregroundDecoration: const BoxDecoration(
              color: AppColors.darkOverlay,
            ),
            child: CachedNetworkImage(
              imageUrl: entity.image,
              memCacheWidth: memCacheWidth,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) =>
                  Image.asset(AppImages.test, cacheWidth: memCacheWidth),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          width: 125,
          child: Text(
            entity.name,
            maxLines: 2,
            textAlign: .center,
            style: AppFont.balooThambi2Bold(
              fontSize: 16,
              color: AppColors.white,
            ).copyWith(height: 1),
          ),
        ),
      ],
    );
  }
}
