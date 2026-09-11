import 'package:aevon/core/network/api_executer.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/profile/data/data_source/edit_profile_data_source.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Named("remoteEditProfileDataSource")
@LazySingleton(as: EditProfileDataSource)
class RemoteEditProfileDataSource implements EditProfileDataSource {
  final Dio _dio;

  RemoteEditProfileDataSource(this._dio);

  @override
  Future<Result<bool>> updateProfileImage(XFile file) async {
    final data = FormData.fromMap({
      "photo": await MultipartFile.fromFile(file.path, filename: file.name),
    });
    return await executeApiCall(
      apiCall: () async =>
          await _dio.put(ApiConstants.uploadProfilePhoto, data: data),
      parser: (response) => response["message"].toString() == "success",
    );
  }

  @override
  Future<Result<bool>> updateFirstName(String firstName) async {
    return await executeApiCall(
      apiCall: () async => await _dio.put(
        ApiConstants.editProfile,
        data: {"firstName": firstName},
      ),
      parser: (data) => data["message"].toString() == "success",
    );
  }

  @override
  Future<Result<bool>> updateLastName(String lastName) async {
    return await executeApiCall(
      apiCall: () async => await _dio.put(
        ApiConstants.editProfile,
        data: {"lastName": lastName},
      ),
      parser: (data) => data["message"].toString() == "success",
    );
  }

  @override
  Future<Result<bool>> updateEmail(String email) async {
    return await executeApiCall(
      apiCall: () async =>
          await _dio.put(ApiConstants.editProfile, data: {"email": email}),
      parser: (data) => data["message"].toString() == "success",
    );
  }

  @override
  Future<Result<bool>> updateWeight(double weight) async {
    return await executeApiCall(
      apiCall: () async =>
          await _dio.put(ApiConstants.editProfile, data: {"weight": weight}),
      parser: (data) => data["message"].toString() == "success",
    );
  }

  @override
  Future<Result<bool>> updateGoal(Goal goal) async {
    return await executeApiCall(
      apiCall: () async =>
          await _dio.put(ApiConstants.editProfile, data: {"goal": goal.name}),
      parser: (data) => data["message"].toString() == "success",
    );
  }

  @override
  Future<Result<bool>> updateActivityLevel(ActivityLevel activityLevel) async {
    return await executeApiCall(
      apiCall: () async => await _dio.put(
        ApiConstants.editProfile,
        data: {"activityLevel": activityLevel.toStringActivityLevel()},
      ),
      parser: (data) => data["message"].toString() == "success",
    );
  }

  Future<Result<bool>> updatePassword(
    String currentPassword,
    String newPassword,
  ) async {
    return await executeApiCall(
      apiCall: () async => await _dio.patch(
        ApiConstants.changePassword,
        data: {"password": currentPassword, "newPassword": newPassword},
      ),
      parser: (data) => data["message"].toString() == "success",
    );
  }
}
