part of 'edit_profile_cubit.dart';

enum EditProfileStatus { initial, loading, success, error }

class EditProfileState extends Equatable {
  final EditProfileStatus status;
  final String? errorMessage;
  final String? successMessage;

  const EditProfileState({
    this.status = EditProfileStatus.initial,
    this.errorMessage,
    this.successMessage,
  });

  EditProfileState copyWith({
    EditProfileStatus? status,
    String? errorMessage,
    String? successMessage,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, successMessage];
}
