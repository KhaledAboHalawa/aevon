import 'package:aevon/core/router/app_routes.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_state.dart';
import 'package:aevon/core/shared/presentation/widgets/app_header.dart';
import 'package:aevon/core/shared/presentation/widgets/profile_avatar.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/profile/presentation/widgets/change_lang_dialog.dart';
import 'package:aevon/features/profile/presentation/widgets/profile_glass_card.dart';
import 'package:aevon/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfleTab extends StatelessWidget {
  const ProfleTab({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 40,
          ),
          child: const AppHeader(type: HeaderType.profile),
        ),
        BlocBuilder<AuthSessionCubit, AuthSessionState>(
          builder: (context, state) {
            final user = state.user;
            return Column(
              children: [
                ProfileAvatar(
                  width: 100,
                  imageUrl: user?.photo,
                  initials:
                      (user?.firstName != null && user!.firstName!.isNotEmpty)
                      ? user.firstName![0]
                      : "T",
                ),
                const SizedBox(height: 8),
                Text(
                  "${user?.firstName ?? ''} ${user?.lastName ?? ''}".trim(),
                  style: AppFont.balooThambi2Bold(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 40),

        ProfileGlassCard(
          child: Column(
            spacing: 16.8,
            children: [
              ProfileMenuTile(
                iconPath: AppIcons.profile,
                title: locale.editProfile,
                onTap: () {
                  context.push(AppRoutes.editProfile);
                },
              ),
              ProfileMenuTile(
                iconPath: AppIcons.change,
                title: locale.changePassword,
                onTap: () => context.push(AppRoutes.forgetPassword),
              ),
              ProfileMenuTile(
                iconPath: AppIcons.language,
                title: locale.selectLanguage,

                onTap: () => showChangeLanguageDialog(context),
              ),
              ProfileMenuTile(
                iconPath: AppIcons.security,
                title: locale.security,
              ),
              ProfileMenuTile(
                iconPath: AppIcons.pricacyPolicy,
                title: locale.privacyPolicy,
              ),
              ProfileMenuTile(iconPath: AppIcons.help, title: locale.help),
              ProfileMenuTile(iconPath: AppIcons.logout, title: locale.logout),
            ],
          ),
        ),
      ],
    );
  }
}
