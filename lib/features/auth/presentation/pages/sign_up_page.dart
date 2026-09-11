import 'package:aevon/features/auth/presentation/widgets/sign_up/sign_up_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/presentation/widgets/app_scafolled.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: .manual,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const SignUpBody(),
        ),
      ),
    );
  }
}
