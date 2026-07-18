import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final String token;
  final User user;

  const SignInEntity({required this.token, required this.user});

  @override
  List<Object?> get props => [token, user];
}
