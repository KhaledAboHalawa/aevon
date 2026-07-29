import 'package:aevon/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.homeBG),
          fit: BoxFit.cover,
        ),
      ),
      child: const Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
