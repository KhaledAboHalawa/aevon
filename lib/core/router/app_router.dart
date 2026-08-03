import 'dart:async';

import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/router/app_routes.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/auth/presentation/pages/sign_in_page.dart';
import 'package:aevon/features/auth/presentation/pages/sign_up_page.dart';
import 'package:aevon/features/forget_password/presentation/pages/forget_password_page.dart';
import 'package:aevon/features/home/presentation/pages/home_page.dart';
import 'package:aevon/features/onboarding/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRoutes.onboarding,
  routes: [
    appRoute(
      name: AppRoutes.onboarding,
      page: (state, context) => const Onboarding(),
      redirect: (context, state) {
        final isSeen =
            getIt<SharedPreferences>().getBool(AppKeys.seenOnboarding) ?? false;
        if (isSeen) return AppRoutes.signIn;
        return null;
      },
    ),
    appRoute(
      name: AppRoutes.signIn,
      page: (state, context) => const SignInPage(),
      redirect: (context, state) {
        String? isSigned = getIt<SharedPreferences>().getString(AppKeys.token);
        if (isSigned != null) return AppRoutes.home;
        return null;
      },
    ),
    appRoute(
      name: AppRoutes.signUp,
      page: (state, context) => const SignUpPage(),
    ),
    appRoute(
      name: AppRoutes.forgetPassword,
      page: (state, context) => const ForgetPasswordPage(),
    ),

    appRoute(
      name: AppRoutes.home,
      page: (state, context) => const HomePage(),
    ),
  ],
);

GoRoute appRoute({
  required String name,
  required Widget Function(GoRouterState state, BuildContext context) page,
  List<RouteBase> routes = const [],
  FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
}) {
  return GoRoute(
    path: name,
    name: name,
    routes: routes,
    redirect: redirect,
    pageBuilder: (context, state) => CustomTransitionPage(
      child: page(state, context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
            ),
            child: child,
          ),
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
    ),
  );
}
