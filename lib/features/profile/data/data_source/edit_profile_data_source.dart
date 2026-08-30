import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class EditProfileDataSource {
  Future<Result<bool>> updateProfileImage(XFile file);
  Future<Result<bool>> updateFirstName(String firstName);
  Future<Result<bool>> updateLastName(String lastName);
  Future<Result<bool>> updateEmail(String email);
  Future<Result<bool>> updateWeight(double weight);
  Future<Result<bool>> updateGoal(Goal goal);
  Future<Result<bool>> updateActivityLevel(ActivityLevel activityLevel);
}