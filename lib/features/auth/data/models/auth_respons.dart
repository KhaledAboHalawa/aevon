import 'package:aevon/features/auth/data/models/user_model.dart';

class AuthResonse {
  String? message;
  User? user;
  String? token;

  AuthResonse({this.message, this.user, this.token});

  AuthResonse.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }
}
