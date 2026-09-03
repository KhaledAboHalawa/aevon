import 'dart:developer';

import 'package:aevon/core/localization/localization_cubit.dart';
import 'package:aevon/core/router/app_router.dart';
import 'package:aevon/core/theme/app_theme.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/dependency_injection.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, Locale>(
      builder: (BuildContext context, Locale state) {
        log("state.languageCode.toString() ${state.languageCode}");
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              // 1. Exact match (en_US → en_US)
              for (final supported in supportedLocales) {
                if (supported == deviceLocale) {
                  return getIt<LocalizationCubit>().loadSavedLocale(
                    deviceLocale: deviceLocale?.languageCode,
                  );
                }
              }
              // 2. Language-only match (en_US → en)
              for (final supported in supportedLocales) {
                if (supported.languageCode == deviceLocale?.languageCode) {
                  return getIt<LocalizationCubit>().loadSavedLocale(
                    deviceLocale: deviceLocale?.languageCode,
                  );
                }
              }
              // 3. Nothing matched → fallback
              return const Locale(AppKeys.englishLocale);
            },
            locale: state,
          ),
        );
      },
    );
  }
}
