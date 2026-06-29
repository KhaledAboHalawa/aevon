import 'dart:ui';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalizationCubit extends Cubit<Locale> {
  final SharedPreferences prefs;

  LocalizationCubit(this.prefs) : super(_loadSavedLocale(prefs));

  static Locale _loadSavedLocale(SharedPreferences prefs) {
    final code = prefs.getString(AppKeys.localeKey) ?? AppKeys.englishLocale;
    return Locale(code);
  }

  void changeLocale(String languageCode) {
    prefs.setString(AppKeys.localeKey, languageCode);
    emit(Locale(languageCode));
  }
}
