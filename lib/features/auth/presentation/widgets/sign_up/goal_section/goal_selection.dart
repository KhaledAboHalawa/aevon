import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/check_card.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalSelection extends StatefulWidget {
  const GoalSelection({super.key, required this.onContinue});
  final void Function(int index) onContinue;
  @override
  State<GoalSelection> createState() => _GoalSelectionState();
}

class _GoalSelectionState extends State<GoalSelection> {
  Goal? selectedGoal;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CheckCard(
          title: Goal.loseWeight.name,
          isSelected: Goal.loseWeight == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.loseWeight),
        ),
        CheckCard(
          title: Goal.gainWeight.name,
          isSelected: Goal.gainWeight == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.gainWeight),
        ),
        CheckCard(
          title: Goal.getFitter.name,
          isSelected: Goal.getFitter == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.getFitter),
        ),
        CheckCard(
          title: Goal.getMoreFlexible.name,
          isSelected: Goal.getMoreFlexible == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.getMoreFlexible),
        ),
        CheckCard(
          title: Goal.learnTheBasic.name,
          isSelected: Goal.learnTheBasic == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.learnTheBasic),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomButton(
            backgroundColor: AppColors.mainOrange,
            title: AppLocalizations.of(context)!.next,
            isLoading: false,
            onPressed: (selectedGoal == null)
                ? null
                : () {
                    widget.onContinue(6);
                    BlocProvider.of<AuthCubit>(context).signUpRequest.goal =
                        selectedGoal!;
                  },
          ),
        ),
      ],
    );
  }
}
