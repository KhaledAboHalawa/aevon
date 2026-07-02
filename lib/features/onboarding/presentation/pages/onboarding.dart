import 'package:aevon/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_text_field.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 77, 81),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
              },
              child: const Text('Go to Login'),
            ),
            CustomTextField(
              hint: 'Password',
              controller: TextEditingController(),
              focusNode: FocusNode(),
              isPassword: true,
              prefixIconPath: AppIcons.mailIcon,
            ),
            const Text('Onboarding Page'),
          ],
        ),
      ),
    );
  }
}
