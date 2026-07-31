import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/progress_indicator/progress_widget.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/sign_up_slider.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  int selectedIndex = 0;
  bool isFirstLoad = true;
  late AppLocalizations locale;
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
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () => setState(() {
                        if (selectedIndex > 0) {
                          --selectedIndex;
                        } else {
                          Navigator.pop(context);
                        }
                      }),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.mainOrange,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    Image.asset(AppImages.logo, width: 70),
                  ],
                ),
              ),
              const SizedBox(width: 70),
            ],
          ),
          const SizedBox(height: 34),
          if (selectedIndex != 0)
            Padding(
              padding: const EdgeInsets.only(top: 51.0),
              child: RegistrationProgressArc(
                currentStep: selectedIndex,
                totalSteps: 7,
                size: 40,
              ),
            ),
          SignUpSlider(
            index: selectedIndex,
            onNext: () => setState(() {
              ++selectedIndex;
            }),
          ),
        ],
      ),
    );
  }
}
