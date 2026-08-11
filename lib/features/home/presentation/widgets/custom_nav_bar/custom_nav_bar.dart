import 'dart:developer';

import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/router/app_routes.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/ai_chat/data/datasources/gemini_data_source.dart';
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import 'package:aevon/features/home/presentation/widgets/custom_nav_bar/custmo_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatefulWidget {
  final ValueChanged<int> onTap;

  const CustomNavBar({super.key, required this.onTap});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late final AiChatCubit _aiChatCubit;
  int _currentIndex = 0;
  int _previousIndex = 0;

  @override
  void initState() {
    super.initState();
    _aiChatCubit = getIt<AiChatCubit>();
  }

  void _onItemTapped(int index) {
    setState(() {
      HapticFeedback.heavyImpact();
      widget.onTap(index);
      _previousIndex = _currentIndex;
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(bottom: 32, left: 32, right: 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 69,
          color: AppColors.lightBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustmoNavBarItem(
                iconPath: AppIcons.home,
                title: 'Explore',
                selected: _currentIndex == 0,
                onTap: (index) {
                  _onItemTapped(index);
                },
                index: 0,
              ),
              BlocProvider(
                create: (context) => _aiChatCubit,
                child: CustmoNavBarItem(
                  iconPath: AppIcons.aiChat,
                  title: 'Chat',
                  selected: _currentIndex == 1,
                  onTap: (index) async {
                    _onItemTapped(index);
                    if (!_aiChatCubit.state.isOnboardingSeen) {
                      final result =
                          await context.push(AppRoutes.chatOnboarding) as bool?;
                      if (result ?? true) {
                        _onItemTapped(_previousIndex);
                      }
                    }
                  },
                  index: 1,
                ),
              ),
              CustmoNavBarItem(
                iconPath: AppIcons.workOuts,
                title: 'Workouts',
                selected: _currentIndex == 2,
                onTap: (index) {
                  _onItemTapped(index);
                },
                index: 2,
              ),
              CustmoNavBarItem(
                iconPath: AppIcons.profile,
                title: 'Profile',
                selected: _currentIndex == 3,
                onTap: (index) async {
                  _onItemTapped(index);
                  log(
                    (await GeminiChatDataSource().sendMessage(
                      history: [],
                      message: 'Hi there',
                    )).content,
                  );
                },
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
