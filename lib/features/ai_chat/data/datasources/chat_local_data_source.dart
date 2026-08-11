import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class ChatLocalDataSource {
  final SharedPreferences _preferences;
  const ChatLocalDataSource(this._preferences);

  Future<Result<bool>> chatOnboardingSeen() async {
    try {
      final result = await _preferences.setBool(
        AppKeys.chatOnboardingSeen,
        true,
      );
      return Success(result);
    } catch (e) {
      return Error(
        Failure(
          message: e.toString(),
          statusCode: 1,
          success: false,
          status: 1,
        ),
      );
    }
  }

  Result<bool> checkChatOnboardingSeen() {
    try {
      final result = _preferences.getBool(AppKeys.chatOnboardingSeen);
      return Success(result ?? false);
    } catch (e) {
      return Error(
        Failure(
          message: e.toString(),
          statusCode: 1,
          success: false,
          status: 1,
        ),
      );
    }
  }
}
