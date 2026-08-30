import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/core/utils/app_validators.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/app_header.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/edit_pic_section.dart';
import 'package:aevon/features/profile/presentation/widgets/edit_profile/user_info_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final AuthCubit authCubit;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;
  late FocusNode emailFocusNode;

  @override
  void initState() {
    super.initState();
    authCubit = context.read<AuthCubit>();
    firstNameController = TextEditingController(
      text: authCubit.state.authResonse?.user.firstName,
    );
    lastNameController = TextEditingController(
      text: authCubit.state.authResonse?.user.lastName,
    );
    emailController = TextEditingController(
      text: authCubit.state.authResonse?.user.email,
    );
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.homeBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: 40,
                ),
                child: const AppHeader(type: HeaderType.profile),
              ),
              const EditPicSection(),
              const SizedBox(height: 8),
              Text(
                "${context.read<AuthCubit>().state.authResonse?.user.firstName} ${context.read<AuthCubit>().state.authResonse?.user.lastName}",
                style: AppFont.balooThambi2Bold(
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                hint: "First Name",
                controller: firstNameController,
                focusNode: firstNameFocusNode,
                showLableOnTop: false,
                prefixIconPath: AppIcons.userIcon,
                validator: (p0) => AppValidators.isValidName(p0),
              ),
              CustomTextField(
                hint: "Last Name",
                controller: lastNameController,
                focusNode: lastNameFocusNode,
                showLableOnTop: false,
                prefixIconPath: AppIcons.userIcon,
                validator: (p0) => AppValidators.isValidName(p0),
              ),
              CustomTextField(
                hint: "Email",
                controller: emailController,
                focusNode: emailFocusNode,
                showLableOnTop: false,
                prefixIconPath: AppIcons.mailIcon,
                validator: (p0) => AppValidators.isValidEmail(p0),
              ),
              const SizedBox(height: 40),
              const UserInfoField(field: EditProfileField.weight),
              const UserInfoField(field: EditProfileField.goal),
              const UserInfoField(field: EditProfileField.activityLevel),
            ],
          ),
        ),
      ),
    );
  }
}
