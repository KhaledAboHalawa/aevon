import 'package:aevon/core/shared/presentation/widgets/profile_avatar.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/image_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EditPicSection extends StatelessWidget {
  const EditPicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.mainOrange.withValues(alpha: 0.25),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ProfileAvatar(
            width: 100,
            imageUrl: context.read<AuthCubit>().state.authResonse?.user.photo,
            initials:
                context
                    .read<AuthCubit>()
                    .state
                    .authResonse
                    ?.user
                    .firstName?[0] ??
                "T",
          ),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.darkOverlay,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          child: GestureDetector(
            child: SvgPicture.asset(AppIcons.edit),
            onTap: () async {
              final image = await showImagePickerDialog(context);
              if (image != null) {
                // Handle the selected image
              }
            },
          ),
        ),
      ],
    );
  }
}
