enum Gender { male, female }

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
  String? activityLevel;
  String? goal;
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
      activityLevel = json["activityLevel"];
    }
    if (json["goal"] is String) {
      goal = json["goal"];
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
    "gender": (gender ?? Gender.male).name,
    "age": age,
    "weight": weight,
    "height": height,
    "activityLevel": activityLevel,
    "goal": goal,
  };
}
