import 'package:aevon/core/di/dependency_injection.dart';
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
  int index = 0;
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
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.logo, width: 70, height: 48),
          const SizedBox(height: 34),
          if (index != 0)
            const Padding(
              padding: EdgeInsets.only(top: 51.0),
              child: RegistrationProgressArc(
                currentStep: 1,
                totalSteps: 6,
                size: 40,
              ),
            ),
          SignUpSlider(
            index: index,
            onContinue: (index) => setState(() => this.index = index),
          ),
        ],
      ),
    );
  }
}
