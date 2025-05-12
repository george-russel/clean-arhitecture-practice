import 'package:clean_architecture_practice/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_practice/features/todo/domain/respositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class GetTodoUseCase {
  final TodoRepository repository;

  GetTodoUseCase({required this.repository});

  Future<Either<Failure, List<TodoEntity>>> call() async {
    return repository.getTodos();
  }
}
