import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/progress_widget.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onBoardingBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16,
          ),
          child: const SignUpBody(),
        ),
      ),
    );
  }
}
