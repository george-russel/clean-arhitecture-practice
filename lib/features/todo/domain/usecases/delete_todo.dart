import 'package:clean_architecture_practice/core/errors/failures.dart';
import 'package:clean_architecture_practice/features/todo/domain/respositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteTodoUseCase {
  final TodoRepository repository;

  DeleteTodoUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id) async {
    return repository.deleteTodo(id);
  }
}
