import 'package:flutter/material.dart';

import '../../../utils/app_images.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.navBar, this.drawer});
  final Widget body;
  final Widget? navBar;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final memCacheWidth = (screenWidth * MediaQuery.devicePixelRatioOf(context))
        .round();
    return Scaffold(
      endDrawer: drawer,
      extendBody: true,
      bottomNavigationBar: navBar,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      endDrawerEnableOpenDragGesture: false,
      body: Stack(
        fit: .expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.homeBG,
              fit: BoxFit.cover,
              cacheWidth: memCacheWidth,
            ),
          ),
          Positioned.fill(child: body),
        ],
      ),
    );
  }
}
