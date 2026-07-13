import 'package:aevon/core/utils/app_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        signInButton(iconPath: AppIcons.facebook, onTap: () {}),
        signInButton(iconPath: AppIcons.google, onTap: () {}),
        signInButton(iconPath: AppIcons.apple, onTap: () {}),
      ],
    );
  }
}

Widget signInButton({
  required String iconPath,
  required void Function() onTap,
}) {
  return GestureDetector(onTap: onTap, child: SvgPicture.asset(iconPath));
}
