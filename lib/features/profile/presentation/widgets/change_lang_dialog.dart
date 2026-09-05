import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/localization/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

void showChangeLanguageDialog(BuildContext context) async {
  final locale = AppLocalizations.of(context)!;
  LocalizationCubit localizationCubit = getIt<LocalizationCubit>();
  await showDialog<XFile>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.cardDark,
        title: Text(
          locale.selectLanguage,
          style: AppFont.balooThambi2SemiBold(
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side:
                    locale.localeName ==
                        AppKeys.englishLocale
                    ? const BorderSide(color: AppColors.mainOrange, width: 2)
                    : BorderSide.none,
              ),
              trailing:
                  locale.localeName == AppKeys.englishLocale
                  ? const Icon(Icons.check, color: AppColors.mainOrange)
                  : null,
              title: Text(
                locale.english,
                style: AppFont.balooThambi2SemiBold(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
              onTap: () async {
                localizationCubit.changeLocale(AppKeys.englishLocale);

                if (context.mounted) Navigator.pop(context);
              },
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side:
                    locale.localeName == AppKeys.arabicLocale
                    ? const BorderSide(color: AppColors.mainOrange, width: 2)
                    : BorderSide.none,
              ),
              trailing:
                  locale.localeName == AppKeys.arabicLocale
                  ? const Icon(Icons.check, color: AppColors.mainOrange)
                  : null,
              title: Text(
                locale.arabic,
                style: AppFont.balooThambi2SemiBold(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
              onTap: () async {
                localizationCubit.changeLocale(AppKeys.arabicLocale);
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
