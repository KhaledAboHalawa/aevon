import 'package:aevon/core/utils/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@lazySingleton
class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSource({required this.sharedPreferences});

  Future<void> saveToken(String? token) async {
    if (token != null) await sharedPreferences.setString(AppKeys.token, token);
  }

  String? getToken() => sharedPreferences.getString(AppKeys.token);
}
