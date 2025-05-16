import 'package:clean_architecture_practice/core/errors/error_handler.dart';
import 'package:clean_architecture_practice/core/params/todo_params.dart';
import 'package:clean_architecture_practice/features/todo/data/models/todo_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class TodoDataSource {
  Future<Either<Failure, List<TodoModel>>> getTodos();

  Future<Either<Failure, List<TodoModel>>> addTodo(
      {required TodoParams params});

  Future<Either<Failure, List<TodoModel>>> deleteTodo(String id);

  Future<Either<Failure, List<TodoModel>>> toggleTodo(String id);
}

class TodoDataSourceImpl implements TodoDataSource {
  final List<TodoModel> _todos = [];

  @override
  Future<Either<Failure, List<TodoModel>>> getTodos() {
    return handleNetworkError(() async {
      return _todos;
    });
  }

  @override
  Future<Either<Failure, List<TodoModel>>> addTodo(
      {required TodoParams params}) async {
    return handleNetworkError(() async {
      final todo = TodoModel(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: params.title,
          isDone: params.isDone);
      _todos.add(todo);
      return _todos;
    });
  }

  @override
  Future<Either<Failure, List<TodoModel>>> deleteTodo(String id) async {
    return handleNetworkError(() async {
      _todos.removeWhere((todo) => todo.id == id);
      return _todos;
    });
  }

  @override
  Future<Either<Failure, List<TodoModel>>> toggleTodo(String id) async {
    return handleNetworkError(() async {
      final index = _todos.indexWhere((todo) => todo.id == id);
      if (index == -1) throw Exception('Todo not Found');

      final updatedTodo = _todos[index].copyWith(isDone: !_todos[index].isDone);
      _todos[index] = updatedTodo; // <- Important step

      return _todos;
    });
  }
}
