import 'package:clean_architecture_practice/features/login/data/datasources/login_data_source.dart';
import 'package:clean_architecture_practice/features/login/domain/entities/user_entity.dart';
import 'package:clean_architecture_practice/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/login_params.dart';

abstract class LoginRepositoryInternal extends LoginRepository {}

class LoginRepositoryImpl extends LoginRepositoryInternal {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, String>> login(
      {required LoginParams loginParams}) async {
    final response = await dataSource.login(login: loginParams);
    return response.fold(
        (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
        (right) => Right(right));
  }

  @override
  Future<Either<Failure, UserEntity>> getProfile(
      {required String token}) async {
    final response = await dataSource.getProfile(token: token);
    return response.fold(
        (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
        (right) => Right(right));
  }
}
