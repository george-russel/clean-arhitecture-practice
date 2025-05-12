import 'package:clean_architecture_practice/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_architecture_practice/features/todo/domain/respositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class ToggleTodoUseCase {
  final TodoRepository repository;

  ToggleTodoUseCase({required this.repository});

  Future<Either<Failure, TodoEntity>> call(String id) async {
    return repository.toggleTodo(id);
  }
}
