import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/app_counter.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightSelection extends StatefulWidget {
  const HeightSelection({super.key, required this.onNext});
  final void Function() onNext;
  @override
  State<HeightSelection> createState() => _HeightSelectionState();
}

class _HeightSelectionState extends State<HeightSelection> {
  int height = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalNumberPicker(
          label: AppLocalizations.of(context)!.cm,
          minValue: 150,
          maxValue: 230,
          initialValue: 160,
          onChanged: (int value) {
            setState(() {
              height = value;
              BlocProvider.of<AuthCubit>(context).signUpRequest.height = value;
            });
          },
        ),
        const SizedBox(height: 30),
        CustomButton(
          backgroundColor: AppColors.mainOrange,
          title: AppLocalizations.of(context)!.next,
          isLoading: false,
          onPressed: (height == 0) ? null : () => widget.onNext.call(),
        ),
      ],
    );
  }
}
