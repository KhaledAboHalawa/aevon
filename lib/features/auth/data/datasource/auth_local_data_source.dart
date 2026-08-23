import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSource({required this.sharedPreferences});

  Future<void> saveUserInfo(User? user) async {
    if (user == null) return;
    await sharedPreferences.setStringList(AppKeys.userInfo, user.toList());
  }

  User? fetchUserInfo() {
    try{
      final userInfo = sharedPreferences.getStringList(AppKeys.userInfo);
      return userInfo != null ? User.fromList(userInfo) : null;
    }catch(e){
      return null;
    }
  }

  Future<void> saveToken(String? token) async {
    if (token != null) await sharedPreferences.setString(AppKeys.token, token);
  }

  String? getToken() => sharedPreferences.getString(AppKeys.token);
}
