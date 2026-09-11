import 'package:aevon/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../widgets/forget_password_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          toolbarHeight: 80,
          title: Image.asset(AppImages.logo, width: 70),
        ),
        body: const ForgetPasswordBody(),
      ),
    );
  }
}
