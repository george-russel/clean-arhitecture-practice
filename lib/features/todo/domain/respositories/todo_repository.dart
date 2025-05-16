import 'package:clean_architecture_practice/core/errors/failures.dart';
import 'package:clean_architecture_practice/core/params/todo_params.dart';
import 'package:clean_architecture_practice/features/todo/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoEntity>>> getTodos();

  Future<Either<Failure, List<TodoEntity>>> addTodo(
      {required TodoParams params});

  Future<Either<Failure, List<TodoEntity>>> toggleTodo(String id);

  Future<Either<Failure, List<TodoEntity>>> deleteTodo(String id);
}
