import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/presentation/widgets/custom_button.dart';
import '../../../../l10n/app_localizations.dart';

void showLogoutDialog(BuildContext context) {
  final locale = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.cardDark,
        contentPadding: const EdgeInsets.all(24),
        titlePadding: EdgeInsets.zero,
        content: SizedBox(
          width: 300,
          height: 120,
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: AppFont.balooThambi2SemiBold(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  CustomButton(
                    onPressed: () {
                      context.read<AuthSessionCubit>().clearSession();
                      context.pushReplacement(AppRoutes.signIn);
                      context.pop();
                    },
                    backgroundColor: AppColors.blur,
                    isLoading: false,
                    title: locale.logout,
                  ),
                  CustomButton(
                    onPressed: () => Navigator.pop(context),
                    title: "Cancel",
                    backgroundColor: AppColors.mainOrange,
                    isLoading: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
