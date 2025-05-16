import 'package:clean_architecture_practice/core/errors/failures.dart';
import 'package:clean_architecture_practice/core/params/login_params.dart';
import 'package:clean_architecture_practice/features/login/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login({required LoginParams loginParams});
  Future<Either<Failure, UserEntity>> getProfile({required String token});
}
