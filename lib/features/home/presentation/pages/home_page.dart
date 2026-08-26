import 'package:aevon/core/utils/app_images.dart';
import 'package:aevon/features/ai_chat/presentation/pages/chat_tab.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/conversation_history_drawer.dart';
import 'package:aevon/features/home/presentation/widgets/custom_nav_bar/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  final List<Widget> _tabs = [
    const Center(child: Text('Explore')),
    const ChatTab(),
    const Center(child: Text('Search')),
    const Center(child: Text('Profile')),
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
        endDrawer: const ConversationHistoryDrawer(),
        backgroundColor: Colors.transparent,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _tabs,
        ),
        bottomNavigationBar: CustomNavBar(
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}
