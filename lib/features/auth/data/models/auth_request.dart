import 'package:aevon/features/auth/data/models/user_model.dart';

class SignInRequest {
  final String email;
  final String password;

  SignInRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class SignUpRequest {
  String firstName;
  String lastName;
  String email;
  String password;
  Gender gender;
  int height;
  int weight;
  int age;
  Goal goal;
  ActivityLevel activityLevel;

  SignUpRequest({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.gender = Gender.male,
    this.height = 0,
    this.weight = 0,
    this.age = 0,
    this.goal = Goal.loseWeight,
    this.activityLevel = ActivityLevel.rookie,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'gender': gender.name,
    'height': height,
    'weight': weight,
    'age': age,
    'goal': goal.name,
    'activityLevel': activityLevel.name,
  };

  @override
  String toString() => toJson().toString();
}
