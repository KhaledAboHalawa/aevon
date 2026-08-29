import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/profile_avatar.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key, this.userName, this.type = HeaderType.chat});
  final String? userName;
  final HeaderType type;

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool isFirstLoad = true;
  late final AppLocalizations? locale;
  late final AuthCubit authCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context);
      authCubit = getIt<AuthCubit>();
      isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileAvatar(
            imageUrl: widget.type != .profile
                ? authCubit.state.authResonse?.user.photo
                : null,
            initials: authCubit.state.authResonse?.user.firstName?[0] ?? "T",
          ),
          RichText(
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: true,
              leadingDistribution: TextLeadingDistribution.even,
            ),
            text: TextSpan(
              children: [
                if (widget.type == HeaderType.chatOnboarding)
                  TextSpan(
                    text: "${locale!.hi} ${widget.userName},\n",
                    style: AppFont.balooThambi2Medium(
                      fontSize: 18,
                      color: AppColors.white,
                    ),
                  ),
                TextSpan(
                  text: switch (widget.type) {
                    HeaderType.chatOnboarding =>
                      locale!.chatOnboardingBottomSheetTitle,
                    HeaderType.chat => locale!.chatHeaderTitle,
                    HeaderType.profile => "Profile",
                  },
                  style: AppFont.balooThambi2Bold(
                    fontSize: switch (widget.type) {
                      HeaderType.chatOnboarding => 18,
                      HeaderType.chat => 24,
                      HeaderType.profile => 24,
                    },
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () => widget.type == HeaderType.chat
                ? Scaffold.of(context).openEndDrawer()
                : null,
            child: (widget.type == HeaderType.chat)
                ? SvgPicture.asset(AppIcons.menu, width: 29)
                : const SizedBox(width: 29),
          ),
        ],
      ),
    );
  }
}

enum HeaderType { chatOnboarding, chat, profile }
