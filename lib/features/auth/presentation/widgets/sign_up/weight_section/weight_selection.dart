import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/app_counter.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/di/dependency_injection.dart';

class WeightSelection extends StatefulWidget {
  const WeightSelection({super.key, required this.onNext});
  final void Function() onNext;
  @override
  State<WeightSelection> createState() => _WeightSelectionState();
}

class _WeightSelectionState extends State<WeightSelection> {
  int weight = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalNumberPicker(
          label: AppLocalizations.of(context)!.kg,
          minValue: 30,
          maxValue: 250,
          initialValue: 30,
          onChanged: (int value) {
            setState(() {
              weight = value;
              getIt<AuthCubit>().signUpRequest.weight = value;
            });
          },
        ),
        const SizedBox(height: 30),
        CustomButton(
          backgroundColor: AppColors.mainOrange,
          title: AppLocalizations.of(context)!.next,
          isLoading: false,
          onPressed: (weight == 0) ? null : () => widget.onNext.call(),
        ),
      ],
    );
  }
}
