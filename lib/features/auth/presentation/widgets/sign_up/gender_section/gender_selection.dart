import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/gender_section/gender_button.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.onNext});
  final void Function() onNext;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderButton(
          gender: Gender.male,
          isSelected: selectedGender == Gender.male,
          onPressed: (g) {
            setState(() {
              selectedGender = Gender.male;
            });
          },
        ),
        const SizedBox(height: 24),
        GenderButton(
          gender: Gender.female,
          isSelected: selectedGender == Gender.female,
          onPressed: (g) {
            setState(() {
              selectedGender = Gender.female;
            });
          },
        ),
        const SizedBox(height: 24),
        CustomButton(
          backgroundColor: AppColors.mainOrange,
          title: AppLocalizations.of(context)!.next,
          isLoading: false,
          onPressed: (selectedGender == null)
              ? null
              : () {
                  getIt<AuthCubit>().signUpRequest.gender =
                      selectedGender!;
                  widget.onNext.call();
                },
        ),
      ],
    );
  }
}
