import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_state.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
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
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: 1,
          children: [
            Text(
              "${widget.field.title} (",
              style: AppFont.balooThambi2SemiBold(
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Tap To Edit",
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
                    "${state.user?.weight ?? ""} ${widget.field == EditProfileField.weight ? "Kg" : ""}",
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
                    state.user?.goal?.name ?? "",
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
                    state.user?.activityLevel?.name ?? "",
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
