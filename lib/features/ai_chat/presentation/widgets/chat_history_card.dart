import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';

class ChatHistoryCard extends StatelessWidget {
  const ChatHistoryCard({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 45,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.mainOrange,
                  size: 16,
                ),
                Text(
                  title,
                  style: AppFont.balooThambi2Medium(
                    fontSize: 12,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
            const Divider(color: AppColors.textGrey, thickness: 1),
          ],
        ),
      ),
    );
  }
}
