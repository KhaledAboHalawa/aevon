import 'package:aevon/core/shared/presentation/widgets/profile_avatar.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatHeader extends StatefulWidget {
  const ChatHeader({super.key, required this.isInboarding, this.userName});
  final bool isInboarding;
  final String? userName;

  @override
  State<ChatHeader> createState() => _ChatHeaderState();
}

class _ChatHeaderState extends State<ChatHeader> {
  bool isFirstLoad = true;
  late final AppLocalizations? locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context);
      isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        const ProfileAvatar(
          imageUrl:
              "https://www.themealdb.com/images/media/meals/dxs5t71782678369.jpg",
          initials: "k",
        ),
        Expanded(
          child: RichText(
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: true,
              leadingDistribution: TextLeadingDistribution.even,
            ),
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                if (widget.isInboarding)
                  TextSpan(
                    text: "${locale!.hi} ${widget.userName},\n",
                    style: AppFont.balooThambi2Medium(
                      fontSize: 18,
                      color: AppColors.white,
                    ),
                  ),
                TextSpan(
                  text: widget.isInboarding
                      ? locale!.chatOnboardingBottomSheetTitle
                      : locale!.chatHeaderTitle,
                  style: AppFont.balooThambi2Bold(
                    fontSize: widget.isInboarding ? 18 : 24,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(onTap: () {}, child: SvgPicture.asset(AppIcons.menu)),
        const SizedBox(width: 16),
      ],
    );
  }
}
