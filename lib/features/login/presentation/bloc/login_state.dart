import 'package:clean_architecture_practice/features/login/domain/entities/user_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

class GetProfile extends LoginState {
  final UserEntity userEntity;

  GetProfile({required this.userEntity});
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}
