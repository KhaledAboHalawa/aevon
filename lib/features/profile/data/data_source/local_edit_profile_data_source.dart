import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/profile/data/data_source/edit_profile_data_source.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Named("localEditProfileDataSource")
@LazySingleton(as: EditProfileDataSource)
class LocalEditProfileDataSource implements EditProfileDataSource {
  final SharedPreferences _sharedPreferences;
  const LocalEditProfileDataSource(this._sharedPreferences);

  Future<Result<bool>> _updateUserField(void Function(User user) update) async {
    try {
      final list = _sharedPreferences.getStringList(AppKeys.userInfo);
      User user;
      if (list != null && list.isNotEmpty) {
        try {
          user = User.fromList(list);
        } catch (_) {
          user = User();
        }
      } else {
        user = User();
      }
      update(user);
      final result = await _sharedPreferences.setStringList(
        AppKeys.userInfo,
        user.toList(),
      );
      return Success(result);
    } catch (_) {
      return const Success(false);
    }
  }

  @override
  Future<Result<bool>> updateProfileImage(XFile file) async {
     _updateUserField((user) {
      final oldPath = user.photo;
      if (oldPath != null && oldPath.isNotEmpty) {
        final sections = oldPath.split("/");
        sections.removeLast();
        sections.add(file.name);
        user.photo = sections.join("/");
      }
    });
    return const Success(true);
  }

  @override
  Future<Result<bool>> updateFirstName(String firstName) async {
    return _updateUserField((user) => user.firstName = firstName);
  }

  @override
  Future<Result<bool>> updateLastName(String lastName) async {
    return _updateUserField((user) => user.lastName = lastName);
  }

  @override
  Future<Result<bool>> updateEmail(String email) async {
    return _updateUserField((user) => user.email = email);
  }

  @override
  Future<Result<bool>> updateWeight(double weight) async {
    return _updateUserField((user) => user.weight = weight.toInt());
  }

  @override
  Future<Result<bool>> updateGoal(Goal goal) async {
    return _updateUserField((user) => user.goal = goal);
  }

  @override
  Future<Result<bool>> updateActivityLevel(ActivityLevel activityLevel) async {
    return _updateUserField((user) => user.activityLevel = activityLevel);
  }
}
