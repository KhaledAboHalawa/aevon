import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/check_card.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalSelection extends StatefulWidget {
  const GoalSelection({super.key, required this.onNext});
  final void Function() onNext;
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
          title: Goal.loseWeight.getTitle(context),
          isSelected: Goal.loseWeight == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.loseWeight),
        ),
        CheckCard(
          title: Goal.gainWeight.getTitle(context),
          isSelected: Goal.gainWeight == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.gainWeight),
        ),
        CheckCard(
          title: Goal.getFitter.getTitle(context),
          isSelected: Goal.getFitter == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.getFitter),
        ),
        CheckCard(
          title: Goal.getMoreFlexible.getTitle(context),
          isSelected: Goal.getMoreFlexible == selectedGoal,
          onTap: () => setState(() => selectedGoal = Goal.getMoreFlexible),
        ),
        CheckCard(
          title: Goal.learnTheBasic.getTitle(context),
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
                    widget.onNext();
                    BlocProvider.of<AuthCubit>(context).signUpRequest.goal =
                        selectedGoal!;
                  },
          ),
        ),
      ],
    );
  }
}
