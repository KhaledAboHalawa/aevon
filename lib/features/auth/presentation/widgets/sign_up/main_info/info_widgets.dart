import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/core/utils/app_validators.dart';
import 'package:aevon/features/auth/presentation/widgets/auth_options.dart';
import 'package:aevon/features/auth/presentation/widgets/custom_divider.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/navigate_to_log_in.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key, required this.onContinue});
  final void Function(int index) onContinue;
  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  bool isFirstLoad = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final AppLocalizations locale;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context)!;
      firstNameController = TextEditingController();
      lastNameController = TextEditingController();
      emailController = TextEditingController();
      passwordController = TextEditingController();
      isFirstLoad = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            locale.register,
            style: AppFont.balooThambi2ExtraBold(
              fontSize: 24,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onChange: (p0) => setState(() {}),
            hint: locale.firstName,
            controller: firstNameController,
            isPassword: false,
            prefixIconPath: AppIcons.userIcon,
            validator: (p0) => AppValidators.isValidName(p0),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            onChange: (p0) => setState(() {}),
            hint: locale.lastName,
            controller: lastNameController,
            isPassword: false,
            prefixIconPath: AppIcons.userIcon,
            validator: (p0) => AppValidators.isValidName(p0),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: locale.email,
            controller: emailController,
            isPassword: false,
            prefixIconPath: AppIcons.mailIcon,
            onChange: (p0) => setState(() {}),
            validator: (p0) => AppValidators.isValidEmail(p0),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: locale.password,
            controller: passwordController,
            isPassword: true,
            prefixIconPath: AppIcons.passwordIcon,
            onChange: (p0) => setState(() {}),
            validator: (p0) => AppValidators.isValidPassword(p0),
          ),
          const SizedBox(height: 24),
          const CustomDivider(),
          const SizedBox(height: 24),
          const AuthOptions(),
          const SizedBox(height: 24),
          CustomButton(
            backgroundColor: AppColors.mainOrange,
            isLoading: false,
            title: locale.signIn,
            onPressed:
                (firstNameController.text.isEmpty ||
                    lastNameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty)
                ? null
                : () {
                    if (formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      widget.onContinue(1);
                    }
                  },
          ),
          const SizedBox(height: 8),
          const NavigateToLogIn(),
        ],
      ),
    );
  }
}
