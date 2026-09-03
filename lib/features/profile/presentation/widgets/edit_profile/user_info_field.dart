import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_state.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoField extends StatefulWidget {
  const UserInfoField({super.key, required this.field});
  final EditProfileField field;

  @override
  State<UserInfoField> createState() => _UserInfoFieldState();
}

class _UserInfoFieldState extends State<UserInfoField> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: 1,
          children: [
            Text(
              "${widget.field.getTitle(context)} (",
              style: AppFont.balooThambi2SemiBold(
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                locale.tapToEdit,
                style: AppFont.balooThambi2SemiBold(
                  fontSize: 14,
                  color: AppColors.mainOrange,
                ),
              ),
            ),
            Text(
              ")",
              style: AppFont.balooThambi2SemiBold(
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        Container(
          height: 42,
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.textGrey.withValues(alpha: 0.2),
            borderRadius: .circular(20),
            border: Border.all(color: AppColors.buttonGrey),
          ),
          child: BlocBuilder<AuthSessionCubit, AuthSessionState>(
            builder: (context, state) => switch (widget.field) {
              EditProfileField.weight => Row(
                children: [
                  Text(
                    "${state.user?.weight ?? ""} ${widget.field == EditProfileField.weight ? locale.kg : ""}",
                    style: AppFont.balooThambi2Bold(
                      fontSize: 12,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
              EditProfileField.goal => Row(
                children: [
                  Text(
                    state.user?.goal?.getTitle(context) ?? "",
                    style: AppFont.balooThambi2Bold(
                      fontSize: 12,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
              EditProfileField.activityLevel => Row(
                children: [
                  Text(
                    state.user?.activityLevel?.getTitle(context) ?? "",
                    style: AppFont.balooThambi2Bold(
                      fontSize: 12,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            },
          ),
        ),
      ],
    );
  }
}

enum EditProfileField {
  weight,
  goal,
  activityLevel;

  String getTitle(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    switch (this) {
      case EditProfileField.weight:
        return locale.yourWeight;
      case EditProfileField.goal:
        return locale.yourGoal;
      case EditProfileField.activityLevel:
        return locale.yourActivityLevel;
    }
  }

  String get title {
    switch (this) {
      case EditProfileField.weight:
        return "Your Weight";
      case EditProfileField.goal:
        return "Your Goal";
      case EditProfileField.activityLevel:
        return "Your Activity Level";
    }
  }
}
