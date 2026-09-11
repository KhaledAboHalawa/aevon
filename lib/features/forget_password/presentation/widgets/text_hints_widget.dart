import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TextHintsWidget extends StatefulWidget {
  const TextHintsWidget({super.key, required this.currentPage});
  final int currentPage;

  @override
  State<TextHintsWidget> createState() => _TextHintsWidgetState();
}

class _TextHintsWidgetState extends State<TextHintsWidget> {
  bool isLocalized = false;
  late final AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isLocalized) {
      locale = AppLocalizations.of(context)!;
      isLocalized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      duration: const Duration(milliseconds: 400),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: locale.forgetPasswordTitles(widget.currentPage.toString()),
              style: AppFont.balooThambi2ExtraBold(
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
            const TextSpan(text: '\n'),
            TextSpan(
              text: locale.forgetPasswordSubtitles(
                widget.currentPage.toString(),
              ),
              style: AppFont.balooThambi2Regular(
                fontSize: 18,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
