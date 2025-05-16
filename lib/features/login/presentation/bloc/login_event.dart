import 'package:clean_architecture_practice/core/params/login_params.dart';

abstract class LoginEvent {}

class OnLogin extends LoginEvent {
  final LoginParams loginParams;

  OnLogin({required this.loginParams});
}

class OnGetProfile extends LoginEvent {
  final String token;

  OnGetProfile({required this.token});
}
