import '../../../../core/params/todo_params.dart';

abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoParams params;
  AddTodo(this.params);
}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}

class ToggleTodo extends TodoEvent {
  final String id;
  ToggleTodo(this.id);
}
