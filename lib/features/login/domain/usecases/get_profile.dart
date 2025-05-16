import 'package:clean_architecture_practice/core/errors/failures.dart';
import 'package:clean_architecture_practice/features/login/domain/entities/user_entity.dart';
import 'package:clean_architecture_practice/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase {
  final LoginRepository repository;

  GetProfileUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call(String token) =>
      repository.getProfile(token: token);
}
