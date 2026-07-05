import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/localization/localization_cubit.dart';
import 'package:aevon/core/router/app_router.dart';
import 'package:aevon/core/theme/app_theme.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (BuildContext context, Locale state) =>
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Color(0Xff54433b),
                systemNavigationBarIconBrightness: Brightness.light,
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
                    if (supported == deviceLocale) return supported;
                  }
                  // 2. Language-only match (en_US → en)
                  for (final supported in supportedLocales) {
                    if (supported.languageCode == deviceLocale?.languageCode) {
                      return supported;
                    }
                  }
                  // 3. Nothing matched → fallback
                  return Locale('en');
                },
              ),
            ),
      ),
    );
  }
}
