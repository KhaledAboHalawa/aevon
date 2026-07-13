import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_button.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/core/utils/app_validators.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_events.dart';
import 'package:aevon/features/auth/presentation/widgets/blured_card.dart';
import 'package:aevon/features/auth/presentation/widgets/navigate_to_sing_up.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_in_divider.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_in_options.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isFirstLoad = true;
  late final AuthCubit authCubit;
  late final AppLocalizations locale;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    authCubit = getIt<AuthCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context)!;
      isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (BuildContext context) => authCubit,
      child: BlocSelector<AuthCubit, AuthState, bool>(
        builder: (context, state) {
          return Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.authBG),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 16,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppImages.logo,
                          width: 70,
                          height: 48,
                        ),
                      ),
                      const SizedBox(height: 77.5),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 8),
                        child: RichText(
                          text: TextSpan(
                            text: '${locale.heyThere}\n',
                            style: AppFont.balooThambi2Regular(
                              fontSize: 18,
                              color: AppColors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: locale.welecomeBack,
                                style: AppFont.balooThambi2ExtraBold(
                                  fontSize: 20,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BluredCard(
                        children: [
                          Text(
                            locale.signIn,
                            style: AppFont.balooThambi2ExtraBold(
                              fontSize: 24,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            hint: locale.email,
                            canRequestFocus: !state,
                            isPassword: false,
                            controller: emailController,
                            focusNode: emailFocusNode,
                            validator: AppValidators.isValidEmail,
                            prefixIconPath: AppIcons.mailIcon,
                          ),
                          CustomTextField(
                            hint: locale.password,
                            isPassword: true,
                            canRequestFocus: !state,
                            prefixIconPath: AppIcons.passwordIcon,
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CustomTextButton(
                              title: locale.forgetPassword,
                              onPressed: () {},
                              style: AppFont.balooThambi2Regular(
                                fontSize: 12,
                                color: AppColors.mainOrange,
                              ),
                              color: AppColors.mainOrange,
                            ),
                          ),
                         const SizedBox(height: 24),
                         const SignInDivider(),
                         const SizedBox(height: 24),
                         const SignInOptions(),
                         const SizedBox(height: 24),
                          CustomButton(
                            backgroundColor: AppColors.mainOrange,
                            isLoading: state,
                            title: locale.signIn,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                authCubit.doIntent(
                                  SignInEvent(
                                    request: SignInRequest(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                         const NavigateToSingUp(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        selector: (AuthState state) {
          return state.isLoading;
        },
      ),
    );
  }
}
