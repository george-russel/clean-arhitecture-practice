import 'package:clean_architecture_practice/core/params/todo_params.dart';
import 'package:clean_architecture_practice/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_practice/features/todo/domain/respositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class AddTodoUseCase {
  final TodoRepository repository;

  AddTodoUseCase({required this.repository});

  Future<Either<Failure, List<TodoEntity>>> call(TodoParams params) async {
    return repository.addTodo(params: params);
  }
}
