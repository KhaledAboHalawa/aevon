import 'package:aevon/core/router/app_routes.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class NavigateToLogIn extends StatelessWidget {
  const NavigateToLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          AppLocalizations.of(context)!.alreadyHaveAccount,
          style: AppFont.balooThambi2Regular(
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        CustomTextButton(
          onPressed: () {
            (context).push(AppRoutes.signUp);
          },
          title: AppLocalizations.of(context)!.signIn,
          style: AppFont.balooThambi2ExtraBold(
            fontSize: 14,
            color: AppColors.lightOrange.withAlpha(255),
          ),
          color: AppColors.lightOrange.withAlpha(255),
        ),
      ],
    );
  }
}
