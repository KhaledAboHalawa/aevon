import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/app_counter.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OldSelection extends StatefulWidget {
  const OldSelection({super.key, required this.onContinue});
  final void Function(int index) onContinue;
  @override
  State<OldSelection> createState() => _OldSelectionState();
}

class _OldSelectionState extends State<OldSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalYearPicker(
          minValue: 1,
          maxValue: 100,
          initialValue: 20,
          onChanged: (int value) {},
        ),
        const SizedBox(height: 30),
        CustomButton(
          backgroundColor: AppColors.mainOrange,
          title: AppLocalizations.of(context)!.next,
          isLoading: false,
          onPressed: () => widget.onContinue(2),
        ),
      ],
    );
  }
}
