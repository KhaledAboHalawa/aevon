import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/localization/localization_cubit.dart';
import 'package:aevon/core/router/app_router.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (BuildContext context, Locale state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
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
    );
  }
}
