import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/utils/app_icons.dart';
import 'package:aevon/features/home/presentation/widgets/custom_nav_bar/custmo_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNavBar extends StatefulWidget {
  final ValueChanged<int> onTap;

  const CustomNavBar({super.key, required this.onTap});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;
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
                  setState(() {
                    HapticFeedback.selectionClick();
                    _currentIndex = index;
                    widget.onTap(index);
                  });
                },
                index: 0,
              ),
              CustmoNavBarItem(
                iconPath: AppIcons.aiChat,
                title: 'Chat',
                selected: _currentIndex == 1,
                onTap: (index) {
                  setState(() {
                    HapticFeedback.selectionClick();
                    _currentIndex = index;
                    widget.onTap(index);
                  });
                },
                index: 1,
              ),
              CustmoNavBarItem(
                iconPath: AppIcons.workOuts,
                title: 'Workouts',
                selected: _currentIndex == 2,
                onTap: (index) {
                  setState(() {
                    HapticFeedback.selectionClick();
                    _currentIndex = index;
                    widget.onTap(index);
                  });
                },
                index: 2,
              ),
              CustmoNavBarItem(
                iconPath: AppIcons.profile,
                title: 'Profile',
                selected: _currentIndex == 3,
                onTap: (index) {
                  setState(() {
                    HapticFeedback.selectionClick();
                    _currentIndex = index;
                    widget.onTap(index);
                  });
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
