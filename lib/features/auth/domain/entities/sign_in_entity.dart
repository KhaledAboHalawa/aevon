import 'package:aevon/features/auth/data/models/user_model.dart';

class SignInEntity {
  final String token;
  final User user;

  SignInEntity({required this.token, required this.user});
}
