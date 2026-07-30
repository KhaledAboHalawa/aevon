import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/home/presentation/widgets/custom_nav_bar/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.homeBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: const Column(children: [Center(child: Text('Home'))]),
        bottomNavigationBar: CustomNavBar(
          currentIndex: currentIndex,
          onTap: (d) {
            setState(() {
              currentIndex = d;
            });
          },
        ),
      ),
    );
  }
}
