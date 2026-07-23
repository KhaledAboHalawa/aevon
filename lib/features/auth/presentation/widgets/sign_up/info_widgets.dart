import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/auth/presentation/widgets/auth_options.dart';
import 'package:aevon/features/auth/presentation/widgets/custom_divider.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/navigate_to_log_in.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  bool isFirstLoad = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final AppLocalizations locale;
  late final TextEditingController controller;
  late final FocusNode focusNode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context)!;
      controller = TextEditingController();
      focusNode = FocusNode();
      isFirstLoad = false;
    }
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
            hint: locale.firstName,
            controller: controller,
            focusNode: focusNode,
            isPassword: false,
            prefixIconPath: AppIcons.userIcon,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: locale.lastName,
            controller: controller,
            focusNode: focusNode,
            isPassword: false,
            prefixIconPath: AppIcons.userIcon,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: locale.email,
            controller: controller,
            focusNode: focusNode,
            isPassword: false,
            prefixIconPath: AppIcons.mailIcon,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hint: locale.password,
            controller: controller,
            focusNode: focusNode,
            isPassword: true,
            prefixIconPath: AppIcons.passwordIcon,
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
            onPressed: () {
              if (formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
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
