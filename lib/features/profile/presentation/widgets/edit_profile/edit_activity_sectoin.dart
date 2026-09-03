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

class EditActivitySection extends StatefulWidget {
  const EditActivitySection({super.key});
  @override
  State<EditActivitySection> createState() => _EditActivitySectionState();
}

class _EditActivitySectionState extends State<EditActivitySection> {
  late EditProfileCubit _cubit;
  ActivityLevel? selectedActivity;
  @override
  void initState() {
    super.initState();
    _cubit = getIt<EditProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        CheckCard(
          title: ActivityLevel.rookie.getTitle(context),
          isSelected: ActivityLevel.rookie == selectedActivity,
          onTap: () => setState(() => selectedActivity = ActivityLevel.rookie),
        ),
        CheckCard(
          title: ActivityLevel.beginner.getTitle(context),
          isSelected: ActivityLevel.beginner == selectedActivity,
          onTap: () =>
              setState(() => selectedActivity = ActivityLevel.beginner),
        ),
        CheckCard(
          title: ActivityLevel.intermediate.getTitle(context),
          isSelected: ActivityLevel.intermediate == selectedActivity,
          onTap: () =>
              setState(() => selectedActivity = ActivityLevel.intermediate),
        ),
        CheckCard(
          title: ActivityLevel.advanced.getTitle(context),
          isSelected: ActivityLevel.advanced == selectedActivity,
          onTap: () =>
              setState(() => selectedActivity = ActivityLevel.advanced),
        ),
        CheckCard(
          title: ActivityLevel.trueBeast.getTitle(context),
          isSelected: ActivityLevel.trueBeast == selectedActivity,
          onTap: () =>
              setState(() => selectedActivity = ActivityLevel.trueBeast),
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
              onPressed: (selectedActivity == null)
                  ? null
                  : () {
                      _cubit.doIntent(
                        EditProfileUpdateActivityLevelEvent(selectedActivity!),
                      );
                    },
            ),
          ),
        ),
      ],
    );
  }
}
