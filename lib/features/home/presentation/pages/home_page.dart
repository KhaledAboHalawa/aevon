import 'package:aevon/features/ai_chat/presentation/pages/chat_tab.dart';
import 'package:aevon/features/ai_chat/presentation/widgets/conversation_history_drawer.dart';
import 'package:aevon/features/home/presentation/widgets/custom_nav_bar/custom_nav_bar.dart';
import 'package:aevon/features/profile/presentation/pages/profle_page.dart';
import 'package:aevon/features/workouts/presentation/pages/workout_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/presentation/widgets/app_scafolled.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  final tabs = [
    const Center(child: Text("test")),
    const ChatTab(),
    const WorkoutPage(),
    const ProfleTab(),
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
    return AppScaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: tabs,
      ),
      drawer: const ConversationHistoryDrawer(),
      navBar: CustomNavBar(
        onTap: (index) => _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        ),
      ),
    );
  }
}
