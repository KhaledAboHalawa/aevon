import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/check_card.dart';
import 'package:aevon/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditGoalSection extends StatefulWidget {
  const EditGoalSection({super.key});
  @override
  State<EditGoalSection> createState() => _EditGoalSectionState();
}

class _EditGoalSectionState extends State<EditGoalSection> {
  late EditProfileCubit _cubit;
  Goal? selectedGoal;
  @override
  void initState() {
    super.initState();
    _cubit = getIt<EditProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
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
          child: BlocConsumer<EditProfileCubit, EditProfileState>(
            bloc: _cubit,
            buildWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status == .error) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              } else if (state.status == .success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)!.profileUpdatedSuccessfully,
                    ),
                  ),
                );
                context.pop();
              }
            },
            builder: (context, state) => CustomButton(
              backgroundColor: AppColors.mainOrange,
              title: AppLocalizations.of(context)!.finish,
              isLoading: state.status == .loading,
              onPressed: (selectedGoal == null)
                  ? null
                  : () {
                      _cubit.doIntent(
                        EditProfileUpdateGoalEvent(selectedGoal!),
                      );
                    },
            ),
          ),
        ),
      ],
    );
  }
}
