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

class ForgetPasswordSentEmailWidget extends StatefulWidget {
  const ForgetPasswordSentEmailWidget({super.key});

  @override
  State<ForgetPasswordSentEmailWidget> createState() =>
      _ForgetPasswordSentEmailWidgetState();
}

class _ForgetPasswordSentEmailWidgetState
    extends State<ForgetPasswordSentEmailWidget> {
  bool localized = false;
  late final AppLocalizations locale;
  late final FocusNode focusNode;
  late final TextEditingController controller;
  late final GlobalKey<FormState> formKey;
  late final ForgetPasswordCubit cubit;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    cubit = getIt<ForgetPasswordCubit>();
    formKey = GlobalKey<FormState>();
    focusNode=FocusNode();
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
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 24,
        children: [
          CustomTextField(
            hint: locale.email,
            controller: controller,
            prefixIconPath: AppIcons.mailIcon,
            validator: (p0) => AppValidators.isValidEmail(p0), focusNode: focusNode,
            onSubmitted: (value) => focusNode.unfocus(),
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                cubit.doIntent(
                  ForgetPasswordEventSendEmail(email: controller.text),
                );
              }
            },
            backgroundColor: AppColors.mainOrange,
            title: locale.sendOtp,
            isLoading: context.select(
              (ForgetPasswordCubit cubit) => cubit.state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
