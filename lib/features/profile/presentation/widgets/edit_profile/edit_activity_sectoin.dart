import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_events.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/check_card.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EditActivitySection extends StatefulWidget {
  const EditActivitySection({super.key});
  @override
  State<EditActivitySection> createState() => _EditActivitySectionState();
}

class _EditActivitySectionState extends State<EditActivitySection> {
  late AuthCubit authCubit;
  ActivityLevel? selectedActivity;
  @override
  void initState() {
    super.initState();
    authCubit = getIt<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 16,
        children: [
          CheckCard(
            title: ActivityLevel.rookie.name,
            isSelected: ActivityLevel.rookie == selectedActivity,
            onTap: () =>
                setState(() => selectedActivity = ActivityLevel.rookie),
          ),
          CheckCard(
            title: ActivityLevel.beginner.name,
            isSelected: ActivityLevel.beginner == selectedActivity,
            onTap: () =>
                setState(() => selectedActivity = ActivityLevel.beginner),
          ),
          CheckCard(
            title: ActivityLevel.intermediate.name,
            isSelected: ActivityLevel.intermediate == selectedActivity,
            onTap: () =>
                setState(() => selectedActivity = ActivityLevel.intermediate),
          ),
          CheckCard(
            title: ActivityLevel.advanced.name,
            isSelected: ActivityLevel.advanced == selectedActivity,
            onTap: () =>
                setState(() => selectedActivity = ActivityLevel.advanced),
          ),
          CheckCard(
            title: ActivityLevel.trueBeast.name,
            isSelected: ActivityLevel.trueBeast == selectedActivity,
            onTap: () =>
                setState(() => selectedActivity = ActivityLevel.trueBeast),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomButton(
              backgroundColor: AppColors.mainOrange,
              title: AppLocalizations.of(context)!.finish,
              isLoading: false,
              onPressed: (selectedActivity == null)
                  ? null
                  : () {
                      authCubit.signUpRequest.activityLevel = selectedActivity!;
                      authCubit.doIntent(const SignUpEvent());
                    },
            ),
          ),
        ],
      );
 
  }
}
