import 'package:aevon/core/shared/presentation/widgets/custom_text_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class NavigateToSingUp extends StatelessWidget {
  const NavigateToSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          AppLocalizations.of(context)!.dontHaveAccount,
          style: AppFont.balooThambi2Regular(
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        CustomTextButton(
          onPressed: () {},
          title: AppLocalizations.of(context)!.register,
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
