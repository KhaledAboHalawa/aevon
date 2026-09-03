import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_state.dart';
import 'package:aevon/core/shared/presentation/widgets/app_header.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/core/utils/app_validators.dart';
import 'package:aevon/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/edit_activity_sectoin.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/edit_field_dialog.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/edit_goal_section.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/edit_pic_section.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/edit_weight_section.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/user_info_field.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final AuthSessionCubit authSessionCubit;
  late final EditProfileCubit editProfileCubit;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;
  late FocusNode emailFocusNode;

  @override
  void initState() {
    super.initState();
    authSessionCubit = context.read<AuthSessionCubit>();
    editProfileCubit = getIt<EditProfileCubit>();
    final user = authSessionCubit.state.user;
    firstNameController = TextEditingController(text: user?.firstName);
    lastNameController = TextEditingController(text: user?.lastName);
    emailController = TextEditingController(text: user?.email);
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.homeBG),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider.value(
        value: editProfileCubit,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: 40,
                ),
                child: const AppHeader(type: HeaderType.profile),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31),
                child: Column(
                  children: [
                    const EditPicSection(),
                    const SizedBox(height: 8),
                    BlocBuilder<AuthSessionCubit, AuthSessionState>(
                      buildWhen: (previous, current) =>
                          previous.user?.firstName != current.user?.firstName ||
                          previous.user?.lastName != current.user?.lastName,
                      builder: (context, state) {
                        final user = state.user;
                        return Text(
                          "${user?.firstName ?? ''} ${user?.lastName ?? ''}"
                              .trim(),
                          style: AppFont.balooThambi2Bold(
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      hint: locale.firstName,
                      controller: firstNameController,
                      focusNode: firstNameFocusNode,
                      showLableOnTop: false,
                      prefixIconPath: AppIcons.userIcon,
                      validator: (p0) => AppValidators.isValidName(p0),
                      onSubmitted: (value) => editProfileCubit.doIntent(
                        EditProfileUpdateFirstNameEvent(value),
                      ),
                    ),
                    CustomTextField(
                      hint: locale.lastName,
                      controller: lastNameController,
                      focusNode: lastNameFocusNode,
                      showLableOnTop: false,
                      prefixIconPath: AppIcons.userIcon,
                      validator: (p0) => AppValidators.isValidName(p0),
                      onSubmitted: (value) => editProfileCubit.doIntent(
                        EditProfileUpdateLastNameEvent(value),
                      ),
                    ),
                    CustomTextField(
                      hint: locale.email,
                      controller: emailController,
                      focusNode: emailFocusNode,
                      showLableOnTop: false,
                      prefixIconPath: AppIcons.mailIcon,
                      validator: (p0) => AppValidators.isValidEmail(p0),
                      onSubmitted: (value) => editProfileCubit.doIntent(
                        EditProfileUpdateEmailEvent(value),
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => showEditFieldDialog(
                        context,
                        field: EditProfileField.weight,
                        fieldWidget: const EditWeightSection(),
                      ),
                      child: const UserInfoField(
                        field: EditProfileField.weight,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showEditFieldDialog(
                        context,
                        field: EditProfileField.goal,
                        fieldWidget: const EditGoalSection(),
                      ),
                      child: const UserInfoField(field: EditProfileField.goal),
                    ),
                    GestureDetector(
                      onTap: () => showEditFieldDialog(
                        context,
                        field: EditProfileField.activityLevel,
                        fieldWidget: const EditActivitySection(),
                      ),
                      child: const UserInfoField(
                        field: EditProfileField.activityLevel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
