import 'dart:developer';

import 'package:aevon/core/shared/auth_session/presentation/cubit/auth_session_cubit.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/profile/domain/use_cases/update_activity_level_use_case.dart';
import 'package:aevon/features/profile/domain/use_cases/update_email_use_case.dart';
import 'package:aevon/features/profile/domain/use_cases/update_first_name_use_case.dart';
import 'package:aevon/features/profile/domain/use_cases/update_goal_use_case.dart';
import 'package:aevon/features/profile/domain/use_cases/update_last_name_use_case.dart';
import 'package:aevon/features/profile/domain/use_cases/update_password_use_case.dart';
import 'package:aevon/features/profile/domain/use_cases/update_profile_image_use_case.dart';
import 'package:aevon/features/profile/domain/use_cases/update_weight_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

@lazySingleton
class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateProfileImageUseCase updateProfileImageUseCase;
  final UpdateFirstNameUseCase updateFirstNameUseCase;
  final UpdateLastNameUseCase updateLastNameUseCase;
  final UpdateEmailUseCase updateEmailUseCase;
  final UpdateWeightUseCase updateWeightUseCase;
  final UpdateGoalUseCase updateGoalUseCase;
  final UpdateActivityLevelUseCase updateActivityLevelUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final AuthSessionCubit authSessionCubit;

  EditProfileCubit({
    required this.updateProfileImageUseCase,
    required this.updateFirstNameUseCase,
    required this.updateLastNameUseCase,
    required this.updateEmailUseCase,
    required this.updateWeightUseCase,
    required this.updateGoalUseCase,
    required this.updateActivityLevelUseCase,
    required this.authSessionCubit,
    required this.updatePasswordUseCase,
  }) : super(const EditProfileState());

  void doIntent(EditProfileEvent event) {
    event.when(
      updateProfileImage: _updateProfileImage,
      updateFirstName: _updateFirstName,
      updateLastName: _updateLastName,
      updateEmail: _updateEmail,
      updateWeight: _updateWeight,
      updateGoal: _updateGoal,
      updateActivityLevel: _updateActivityLevel,
      updatePassword: _updatePassword,
    );
  }

  void _updateProfileImage(XFile file) async {
    log("started the process for updating the image");
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updateProfileImageUseCase(file);
    result.when(
      success: (data) {
        log("the image is successfully uploaded");
        authSessionCubit.syncUserData();
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "Profile photo updated successfully",
          ),
        );
      },
      error: (failure) {
        log("the image upload has failed ${failure.message}");
        emit(
          state.copyWith(
            status: EditProfileStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  void _updateFirstName(String firstName) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updateFirstNameUseCase(firstName);
    result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "First name updated successfully",
          ),
        );
      },
      error: (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _updateLastName(String lastName) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updateLastNameUseCase(lastName);
    result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "Last name updated successfully",
          ),
        );
      },
      error: (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _updateEmail(String email) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updateEmailUseCase(email);
    result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "Email updated successfully",
          ),
        );
      },
      error: (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _updateWeight(double weight) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updateWeightUseCase(weight);
    result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "Weight updated successfully",
          ),
        );
      },
      error: (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _updateGoal(Goal goal) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updateGoalUseCase(goal);
    result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "Goal updated successfully",
          ),
        );
      },
      error: (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _updateActivityLevel(ActivityLevel activityLevel) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updateActivityLevelUseCase(activityLevel);
    result.when(
      success: (data) {
        authSessionCubit.fetchSession();
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "Activity level updated successfully",
          ),
        );
      },
      error: (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void _updatePassword(String currentPassword, String newPassword) async {
    emit(state.copyWith(status: EditProfileStatus.loading));
    final result = await updatePasswordUseCase.call(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            successMessage: "Password updated successfully",
          ),
        );
      },
      error: (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: failure.message,
        ),
      ),
    );
  }
}
