import 'package:flutter/material.dart';

import '../../../utils/app_images.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.navBar, this.drawer});
  final Widget body;
  final Widget? navBar;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: drawer,
      bottomNavigationBar: navBar,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(AppImages.homeBG, fit: BoxFit.cover, cacheWidth: 720),
          body,
        ],
      ),
    );
  }
}
