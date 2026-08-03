import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/home/presentation/widgets/custom_nav_bar/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  final List<Widget> _tabs = const [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        body: PageView(controller: _pageController, children: _tabs),
        bottomNavigationBar: CustomNavBar(
          onTap: (d) {
            _pageController.animateToPage(
              d,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
