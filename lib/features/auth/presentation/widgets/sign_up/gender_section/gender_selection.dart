import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/gender_section/gender_button.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GenderButton(gender: Gender.male, isSelected: true),
        SizedBox(height: 24),
        GenderButton(gender: Gender.female, isSelected: false),
      ],
    );
  }
}
