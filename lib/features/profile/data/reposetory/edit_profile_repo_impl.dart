import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/profile/data/data_source/edit_profile_data_source.dart';
import 'package:aevon/features/profile/data/data_source/local_edit_profile_data_source.dart';
import 'package:aevon/features/profile/data/data_source/remote_edit_profile_data_source.dart';
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDataSource remoteEditProfileDataSource;
  final EditProfileDataSource localEditProfileDataSource;
  EditProfileRepoImpl(
    @Named.from(RemoteEditProfileDataSource) this.remoteEditProfileDataSource,
    @Named.from(LocalEditProfileDataSource) this.localEditProfileDataSource,
  );
  @override
  Future<Result<bool>> updateProfileImage(XFile file) async {
    final remoteResult = await remoteEditProfileDataSource.updateProfileImage(
      file,
    );
    if (remoteResult is Success) {
      return await localEditProfileDataSource.updateProfileImage(file);
    }
    return remoteResult;
  }

  @override
  Future<Result<bool>> updateFirstName(String firstName) async {
    final remoteResult = await remoteEditProfileDataSource.updateFirstName(
      firstName,
    );
    if (remoteResult is Success) {
      return await localEditProfileDataSource.updateFirstName(firstName);
    }
    return remoteResult;
  }

  @override
  Future<Result<bool>> updateLastName(String lastName) async {
    final remoteResult = await remoteEditProfileDataSource.updateLastName(
      lastName,
    );
    if (remoteResult is Success) {
      return await localEditProfileDataSource.updateLastName(lastName);
    }
    return remoteResult;
  }

  @override
  Future<Result<bool>> updateEmail(String email) async {
    final remoteResult = await remoteEditProfileDataSource.updateEmail(email);
    if (remoteResult is Success) {
      return await localEditProfileDataSource.updateEmail(email);
    }
    return remoteResult;
  }

  @override
  Future<Result<bool>> updateWeight(double weight) async {
    final remoteResult = await remoteEditProfileDataSource.updateWeight(weight);
    if (remoteResult is Success) {
      return await localEditProfileDataSource.updateWeight(weight);
    }
    return remoteResult;
  }

  @override
  Future<Result<bool>> updateGoal(Goal goal) async {
    final remoteResult = await remoteEditProfileDataSource.updateGoal(goal);
    if (remoteResult is Success) {
      return await localEditProfileDataSource.updateGoal(goal);
    }
    return remoteResult;
  }

  @override
  Future<Result<bool>> updateActivityLevel(ActivityLevel activityLevel) async {
    final remoteResult = await remoteEditProfileDataSource.updateActivityLevel(
      activityLevel,
    );
    if (remoteResult is Success) {
      return await localEditProfileDataSource.updateActivityLevel(
        activityLevel,
      );
    }
    return remoteResult;
  }
}
