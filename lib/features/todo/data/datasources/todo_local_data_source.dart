import 'package:clean_architecture_practice/core/errors/error_handler.dart';
import 'package:clean_architecture_practice/core/params/todo_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/todo_entity.dart';

abstract class TodoDataSource {
  Future<Either<Failure, List<TodoEntity>>> getTodos();

  Future<Either<Failure, TodoEntity>> addTodo({required TodoParams params});

  Future<Either<Failure, void>> deleteTodo(String id);

  Future<Either<Failure, TodoEntity>> toggleTodo(String id);
}

class TodoDataSourceImpl implements TodoDataSource {
  final List<TodoEntity> _todos = [];

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodos() {
    return handleNetworkError(() async {
      return _todos;
    });
  }

  @override
  Future<Either<Failure, TodoEntity>> addTodo(
      {required TodoParams params}) async {
    return handleNetworkError(() async {
      final todo = TodoEntity(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: params.title,
          isDone: params.isDone);
      _todos.add(todo);
      return todo;
    });
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String id) async {
    return handleNetworkError(() async {
      _todos.removeWhere((todo) => todo.id == id);
      return;
    });
  }

  @override
  Future<Either<Failure, TodoEntity>> toggleTodo(String id) async {
    return handleNetworkError(() async {
      final index = _todos.indexWhere((todo) => todo.id == id);
      if (index == -1) throw Exception('Todo not Found');
      final updatedTodo = _todos[index].copyWith(isDone: !_todos[index].isDone);
      return updatedTodo;
    });
  }
}
