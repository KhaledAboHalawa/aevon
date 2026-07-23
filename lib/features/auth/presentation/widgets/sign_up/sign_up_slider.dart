import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/auth/presentation/widgets/blured_card.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/gender_section/gender_selection.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/main_info/info_widgets.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/old_section/old_selection.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignUpSlider extends StatefulWidget {
  const SignUpSlider({
    super.key,
    required this.index,
    required this.onContinue,
  });
  final int index;
  final void Function(int index) onContinue;
  @override
  State<SignUpSlider> createState() => _SignUpSliderState();
}

class _SignUpSliderState extends State<SignUpSlider> {
  bool isFirstLoading = true;
  late AppLocalizations locale;
  List<Widget> get pages => [
    InfoWidget(onContinue: widget.onContinue),
    GenderSelection(onContinue: widget.onContinue),
    OldSelection(onContinue: widget.onContinue),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoading) {
      locale = AppLocalizations.of(context)!;
      isFirstLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: RichText(
            text: TextSpan(
              text: widget.index == 0 ? locale.heyThere : '',
              style: AppFont.balooThambi2Regular(
                fontSize: 18,
                color: AppColors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "\n${locale.signUpTitle("${widget.index}")}",
                  style: AppFont.balooThambi2ExtraBold(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
                TextSpan(
                  text: (widget.index != 0)
                      ? "\n${locale.signUpSubtitle("${widget.index}")}"
                      : '',
                  style: AppFont.balooThambi2Regular(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        BluredCard(child: pages[widget.index]),
      ],
    );
  }
}
