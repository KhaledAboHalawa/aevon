import 'package:aevon/features/auth/data/models/auth_respons.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';

extension SignInEntityMapper on AuthResonse {
  AuthEntity toSignInEntity() =>
      AuthEntity(user: user ?? User(), token: token ?? '');
}
