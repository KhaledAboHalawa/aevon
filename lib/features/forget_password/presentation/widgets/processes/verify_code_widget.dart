import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/core/utils/app_validators.dart';
import 'package:aevon/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:aevon/features/forget_password/presentation/widgets/otp_code_widget.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeWidget extends StatefulWidget {
  const VerifyCodeWidget({super.key});

  @override
  State<VerifyCodeWidget> createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  bool localized = false;
  late final AppLocalizations locale;
  late final TextEditingController controller;
  late final GlobalKey<FormState> formKey;
  late final ForgetPasswordCubit cubit;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    cubit = getIt<ForgetPasswordCubit>();
    formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!localized) {
      locale = AppLocalizations.of(context)!;
      localized = true;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          OtpCodeWidget(onCompleted: (t) {}),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                cubit.doIntent(
                  ForgetPasswordEventSendEmail(email: controller.text),
                );
              }
            },
            backgroundColor: AppColors.mainOrange,
            title: locale.verify,
            isLoading: context.select(
              (ForgetPasswordCubit cubit) => cubit.state.isLoading,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            locale.didntReceiveCode,
            style: AppFont.balooThambi2Regular(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
          CustomTextButton(
            title: locale.resendCode,
            onPressed: () {},
            color: AppColors.mainOrange,
            style: AppFont.balooThambi2Bold(
              color: AppColors.mainOrange,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
