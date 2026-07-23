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
  String rePassword;
  String gender;
  int height;
  int weight;
  int age;
  String goal;
  String activityLevel;

  SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
    required this.activityLevel,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'rePassword': rePassword,
    'gender': gender,
    'height': height,
    'weight': weight,
    'age': age,
    'goal': goal,
    'activityLevel': activityLevel,
  };
}
