import 'package:aevon/core/router/app_routes.dart';
import 'package:aevon/core/shared/presentation/widgets/profile_avatar.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/app_header.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/profile/presentation/widgets/profile_glass_card.dart';
import 'package:aevon/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfleTab extends StatelessWidget {
  const ProfleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,bottom: 40),
          child: const AppHeader(type: HeaderType.profile),
        ),
        ProfileAvatar(
          width: 100,
          imageUrl: context.read<AuthCubit>().state.authResonse?.user.photo,
          initials:
              context.read<AuthCubit>().state.authResonse?.user.firstName?[0] ??
              "T",
        ),
        const SizedBox(height: 8),
        Text(
          "${context.read<AuthCubit>().state.authResonse?.user.firstName} ${context.read<AuthCubit>().state.authResonse?.user.lastName}",
          style: AppFont.balooThambi2Bold(fontSize: 20, color: AppColors.white),
        ),
        const SizedBox(height: 40),

        ProfileGlassCard(
          child: Column(
            spacing: 16.8,
            children: [
              ProfileMenuTile(
                iconPath: AppIcons.profile,
                title: "Edit Profile",
                onTap: () {
                  context.push(AppRoutes.editProfile);
                },
              ),
              const ProfileMenuTile(
                iconPath: AppIcons.change,
                title: "Change Password",
              ),
              const ProfileMenuTile(
                iconPath: AppIcons.language,
                title: "Select Language",
              ),
              const ProfileMenuTile(
                iconPath: AppIcons.security,
                title: "Security",
              ),
              const ProfileMenuTile(
                iconPath: AppIcons.pricacyPolicy,
                title: "Privacy Policy",
              ),
              const ProfileMenuTile(iconPath: AppIcons.help, title: "Help"),
              const ProfileMenuTile(iconPath: AppIcons.logout, title: "Logout"),
            ],
          ),
        ),
      ],
    );
  }
}
