import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/core/utils/app_validators.dart';
import 'package:aevon/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  bool localized = false;
  late final AppLocalizations locale;
  late final TextEditingController passwordController;
  late final TextEditingController rePasswordController;
  late final GlobalKey<FormState> formKey;
  late final ForgetPasswordCubit cubit;
  late final FocusNode focusNode1;
  late final FocusNode focusNode2;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    cubit = getIt<ForgetPasswordCubit>();
    formKey = GlobalKey<FormState>();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
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
    passwordController.dispose();
    rePasswordController.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 10,
        children: [
          CustomTextField(
            hint: locale.password,
            controller: passwordController,
            isPassword: true,
            prefixIconPath: AppIcons.passwordIcon,
            validator: (p0) => AppValidators.isValidPassword(p0),
            focusNode: focusNode1,
            onSubmitted: (_) => focusNode2.requestFocus(),
          ),
          CustomTextField(
            hint: locale.rePassword,
            controller: rePasswordController,
            isPassword: true,
            prefixIconPath: AppIcons.passwordIcon,
            validator: (p0) => AppValidators.isValidConfirmPassword(
              p0,
              passwordController.text,
            ),
            focusNode: focusNode2,
            onSubmitted: (_) => focusNode2.unfocus(),
          ),
          const SizedBox(height: 0),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                cubit.doIntent(
                  ForgetPasswordEventResetPassword(
                    password: passwordController.text,
                  ),
                );
              }
            },
            backgroundColor: AppColors.mainOrange,
            title: locale.next,
            isLoading: context.select(
              (ForgetPasswordCubit cubit) => cubit.state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
