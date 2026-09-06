part of 'edit_profile_cubit.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  void when({
    required Function(XFile file) updateProfileImage,
    required Function(String firstName) updateFirstName,
    required Function(String lastName) updateLastName,
    required Function(String email) updateEmail,
    required Function(double weight) updateWeight,
    required Function(Goal goal) updateGoal,
    required Function(ActivityLevel activityLevel) updateActivityLevel,
    required Function(String currentPassword, String newPassword)
    updatePassword,
  }) {
    switch (this) {
      case EditProfileUpdateProfileImageEvent event:
        updateProfileImage(event.file);
      case EditProfileUpdateFirstNameEvent event:
        updateFirstName(event.firstName);
      case EditProfileUpdateLastNameEvent event:
        updateLastName(event.lastName);
      case EditProfileUpdateEmailEvent event:
        updateEmail(event.email);
      case EditProfileUpdateWeightEvent event:
        updateWeight(event.weight);
      case EditProfileUpdateGoalEvent event:
        updateGoal(event.goal);
      case EditProfileUpdateActivityLevelEvent event:
        updateActivityLevel(event.activityLevel);
      case EditProfileUpdatePasswordEvent event:
        updatePassword(event.currentPassword, event.newPassword);
    }
  }

  @override
  List<Object?> get props => [];
}

class EditProfileUpdateProfileImageEvent extends EditProfileEvent {
  final XFile file;
  const EditProfileUpdateProfileImageEvent(this.file);
  @override
  List<Object?> get props => [file];
}

class EditProfileUpdateFirstNameEvent extends EditProfileEvent {
  final String firstName;
  const EditProfileUpdateFirstNameEvent(this.firstName);
  @override
  List<Object?> get props => [firstName];
}

class EditProfileUpdateLastNameEvent extends EditProfileEvent {
  final String lastName;
  const EditProfileUpdateLastNameEvent(this.lastName);
  @override
  List<Object?> get props => [lastName];
}

class EditProfileUpdateEmailEvent extends EditProfileEvent {
  final String email;
  const EditProfileUpdateEmailEvent(this.email);
  @override
  List<Object?> get props => [email];
}

class EditProfileUpdateWeightEvent extends EditProfileEvent {
  final double weight;
  const EditProfileUpdateWeightEvent(this.weight);
  @override
  List<Object?> get props => [weight];
}

class EditProfileUpdateGoalEvent extends EditProfileEvent {
  final Goal goal;
  const EditProfileUpdateGoalEvent(this.goal);
  @override
  List<Object?> get props => [goal];
}

class EditProfileUpdateActivityLevelEvent extends EditProfileEvent {
  final ActivityLevel activityLevel;
  const EditProfileUpdateActivityLevelEvent(this.activityLevel);
  @override
  List<Object?> get props => [activityLevel];
}

class EditProfileUpdatePasswordEvent extends EditProfileEvent {
  final String currentPassword;
  final String newPassword;
  const EditProfileUpdatePasswordEvent(this.currentPassword, this.newPassword);
  @override
  List<Object?> get props => [currentPassword, newPassword];
}
