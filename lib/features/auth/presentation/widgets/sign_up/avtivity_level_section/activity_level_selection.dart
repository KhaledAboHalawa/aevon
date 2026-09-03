import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/router/app_routes.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_events.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/check_card.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class ActivityLevelSelection extends StatefulWidget {
  const ActivityLevelSelection({super.key});
  @override
  State<ActivityLevelSelection> createState() => _ActivityLevelSelectionState();
}

class _ActivityLevelSelectionState extends State<ActivityLevelSelection> {
  late AuthCubit authCubit;
  ActivityLevel? selectedActivity;
  @override
  void initState() {
    super.initState();
    authCubit = getIt<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state.authResonse != null) {
          context.pushReplacement(AppRoutes.home);
        } else if (state.errorMessage != null) {
          Fluttertoast.showToast(
            msg: state.errorMessage!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: AppColors.white,
            fontSize: 14.0,
          );
        }
      },
      builder: (BuildContext context, state) => Column(
        spacing: 16,
        children: [
          CheckCard(
            title: ActivityLevel.rookie.getTitle(context),
            isSelected: ActivityLevel.rookie == selectedActivity,
            onTap: () =>
                setState(() => selectedActivity = ActivityLevel.rookie),
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
            child: CustomButton(
              backgroundColor: AppColors.mainOrange,
              title: AppLocalizations.of(context)!.finish,
              isLoading: state.isLoading,
              onPressed: (selectedActivity == null)
                  ? null
                  : () {
                      authCubit.signUpRequest.activityLevel = selectedActivity!;
                      authCubit.doIntent(const SignUpEvent());
                    },
            ),
          ),
        ],
      ),
    );
  }
}
