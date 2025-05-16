import 'package:clean_architecture_practice/core/errors/failures.dart';
import 'package:clean_architecture_practice/core/params/login_params.dart';
import 'package:clean_architecture_practice/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<Failure, String>> call(LoginParams loginParams) =>
      repository.login(loginParams: loginParams);
}
