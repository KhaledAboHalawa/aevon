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
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.white,
                  strokeWidth: 2,
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Text('Error')),
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
