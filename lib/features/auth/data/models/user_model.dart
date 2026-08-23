enum Gender { male, female }

enum ActivityLevel { rookie, beginner, intermediate, advanced, trueBeast }

enum Goal { loseWeight, gainWeight, getFitter, getMoreFlexible, learnTheBasic }

extension ActivityLevelExtension on String {
  ActivityLevel toActivityLevel() =>
      ActivityLevel.values.firstWhere((g) => this == g.toStringActivityLevel());
}

extension ActivityLevelExtension2 on ActivityLevel {
  String toStringActivityLevel() => switch (this) {
    ActivityLevel.rookie => 'level1',
    ActivityLevel.beginner => 'level2',
    ActivityLevel.intermediate => 'level3',
    ActivityLevel.advanced => 'level4',
    ActivityLevel.trueBeast => 'level5',
  };
}

extension GoalExtension on String {
  Goal toGoal() => Goal.values.firstWhere((g) => g.name == this);
}

extension GenderExtension on String {
  Gender toGender() => Gender.values.firstWhere((g) => g.name == this);
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  Gender? gender;
  int? age;
  int? weight;
  int? height;
  ActivityLevel? activityLevel;
  Goal? goal;
  String? photo;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
  });

  List<String> toList() => [
        id ?? '',
        firstName ?? '',
        lastName ?? '',
        email ?? '',
        gender?.name ?? '',
        age?.toString() ?? '',
        weight?.toString() ?? '',
        height?.toString() ?? '',
        activityLevel?.toStringActivityLevel() ?? '',
        goal?.name ?? '',
        photo ?? '',
  ];

  User.fromList(List<String> list) {
    if(list.isEmpty) return;
    id = list[0];
    firstName = list[1];
    lastName = list[2];
    email = list[3];
    gender = list[4].toGender();
    age = int.parse(list[5]);
    weight = int.parse(list[6]);
    height = int.parse(list[7]);
    activityLevel = list[8].toActivityLevel();
    goal = list[9].toGoal();
    photo = list[10];
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["firstName"] is String) {
      firstName = json["firstName"];
    }
    if (json["lastName"] is String) {
      lastName = json["lastName"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["gender"] is String) {
      gender = (json["gender"] as String).toGender();
    }
    if (json["age"] is int) {
      age = json["age"];
    }
    if (json["weight"] is int) {
      weight = json["weight"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["activityLevel"] is String) {
      activityLevel = (json["activityLevel"] as String).toActivityLevel();
    }
    if (json["goal"] is String) {
      goal = (json["goal"] as String).toGoal();
    }
    if (json["photo"] is String) {
      photo = json["photo"];
    }
  }
  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "gender": gender!.name,
    "age": age,
    "weight": weight,
    "height": height,
    "activityLevel": activityLevel!..toStringActivityLevel(),
    "goal": goal!.name,
  };
}
