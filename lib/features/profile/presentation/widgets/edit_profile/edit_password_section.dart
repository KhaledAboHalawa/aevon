import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_validators.dart';
import 'package:aevon/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_icons.dart';

class EditPasswordSection extends StatefulWidget {
  const EditPasswordSection({super.key});

  @override
  State<EditPasswordSection> createState() => _EditPasswordSectionState();
}

class _EditPasswordSectionState extends State<EditPasswordSection> {
  late EditProfileCubit _editProfileCubit;
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmNewPasswordController;
  late final FocusNode _currentPasswordFocusNode;
  late final FocusNode _newPasswordFocusNode;
  late final FocusNode _confirmNewPasswordFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _editProfileCubit = getIt<EditProfileCubit>();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();
    _currentPasswordFocusNode = FocusNode();
    _newPasswordFocusNode = FocusNode();
    _confirmNewPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    _currentPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmNewPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: .min,
        spacing: 16,
        children: [
          CustomTextField(
            hint: "Current Password",
            prefixIconPath: AppIcons.passwordIcon,
            controller: _currentPasswordController,
            focusNode: _currentPasswordFocusNode,
            isPassword: true,
            validator: AppValidators.isValidPassword,
          ),
          CustomTextField(
            hint: "New Password",
            prefixIconPath: AppIcons.passwordIcon,
            controller: _newPasswordController,
            focusNode: _newPasswordFocusNode,
            isPassword: true,
            validator: (p0) => AppValidators.isValidPassword(p0),
          ),
          CustomTextField(
            hint: "Confirm New Password",
            prefixIconPath: AppIcons.passwordIcon,
            controller: _confirmNewPasswordController,
            focusNode: _confirmNewPasswordFocusNode,
            isPassword: true,
            validator: (p0) => AppValidators.isValidConfirmPassword(
              p0,
              _newPasswordController.text,
            ),
          ),

          BlocConsumer<EditProfileCubit, EditProfileState>(
            bloc: _editProfileCubit,
            listener: (context, state) {
              if (state.status == .error) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              } else if (state.status == .success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)!.profileUpdatedSuccessfully,
                    ),
                  ),
                );
                context.pop();
              }
            },
            builder: (context, state) => CustomButton(
              backgroundColor: AppColors.mainOrange,
              title: "Update Password",
              isLoading: state.status == .loading,
              isExpanded: true,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _editProfileCubit.doIntent(
                    EditProfileUpdatePasswordEvent(
                      _currentPasswordController.text,
                      _newPasswordController.text,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
