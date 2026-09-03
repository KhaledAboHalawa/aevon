import 'dart:ui';

import 'package:aevon/core/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalizationCubit extends Cubit<Locale> {
  final SharedPreferences prefs;

  LocalizationCubit(this.prefs) : super(const Locale(AppKeys.englishLocale));

  Locale loadSavedLocale({String? deviceLocale = AppKeys.englishLocale}) {
    final code = prefs.getString(AppKeys.localeKey) ?? deviceLocale;
    return Locale(code!);
  }

  void changeLocale(String languageCode) {
    prefs.setString(AppKeys.localeKey, languageCode);
    emit(Locale(languageCode));
  }
}
