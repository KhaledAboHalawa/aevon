import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_state.dart';
import 'package:aevon/core/shared/presentation/widgets/profile_avatar.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/profile/presentation/cubit/edit_profile_cubit.dart';
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
          child: BlocBuilder<AuthSessionCubit, AuthSessionState>(
            buildWhen: (previous, current) =>
                previous.user?.photo != current.user?.photo,
            builder: (context, state) {
              final user = state.user;
              return ProfileAvatar(
                width: 100,
                imageUrl: user?.photo,
                initials:
                    (user?.firstName != null && user!.firstName!.isNotEmpty)
                    ? user.firstName![0]
                    : "T",
              );
            },
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
              if (image != null && context.mounted) {
                context.read<EditProfileCubit>().doIntent(
                  EditProfileUpdateProfileImageEvent(image),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
