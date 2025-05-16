import 'package:clean_architecture_practice/features/todo/data/datasources/todo_data_source.dart';
import 'package:clean_architecture_practice/features/todo/domain/respositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/todo_params.dart';
import '../../domain/entities/todo_entity.dart';

abstract class TodoRepositoryInternal implements TodoRepository {}

class TodoRepositoryImpl implements TodoRepositoryInternal {
  final TodoDataSource dataSource;

  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() async {
    final response = await dataSource.getTodos();
    return response.fold(
      (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
      (right) => Right(right),
    );
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> addTodo(
      {required TodoParams params}) async {
    final response = await dataSource.addTodo(params: params);
    return response.fold(
      (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
      (right) => Right(right),
    );
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> deleteTodo(String id) async {
    final response = await dataSource.deleteTodo(id);
    return response.fold(
      (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
      (right) => Right(right),
    );
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> toggleTodo(String id) async {
    final response = await dataSource.toggleTodo(id);
    return response.fold(
      (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
      (right) => Right(right),
    );
  }
}
