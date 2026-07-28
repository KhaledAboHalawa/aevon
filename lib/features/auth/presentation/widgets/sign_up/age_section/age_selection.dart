
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/app_counter.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelection extends StatefulWidget {
  const AgeSelection({super.key, required this.onContinue});
  final void Function(int index) onContinue;
  @override
  State<AgeSelection> createState() => _AgeSelectionState();
}

class _AgeSelectionState extends State<AgeSelection> {
  int age = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalYearPicker(
          label: AppLocalizations.of(context)!.year,
          minValue: 12,
          maxValue: 100,
          initialValue: 12,
          onChanged: (int value) {
            setState(() {
              age = value;
              BlocProvider.of<AuthCubit>(context).signUpRequest.age = age;
            });
          },
        ),
        const SizedBox(height: 30),
        CustomButton(
          backgroundColor: AppColors.mainOrange,
          title: AppLocalizations.of(context)!.next,
          isLoading: false,
          onPressed: (age == 0) ? null : () => widget.onContinue(3),
        ),
      ],
    );
  }
}
