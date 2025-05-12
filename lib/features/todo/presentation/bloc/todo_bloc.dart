import 'package:clean_architecture_practice/features/todo/domain/usecases/add_todo.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/delete_todo.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/get_todo.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/toggle_todo.dart';
import 'package:clean_architecture_practice/features/todo/presentation/bloc/todo_event.dart';
import 'package:clean_architecture_practice/features/todo/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo_entity.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required this.getTodosUseCase,
    required this.addTodoUseCase,
    required this.deleteTodoUseCase,
    required this.toggleTodoUseCase,
  }) : super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodo>(_onToggleTodo);
  }

  final GetTodoUseCase getTodosUseCase;
  final AddTodoUseCase addTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final ToggleTodoUseCase toggleTodoUseCase;

  // Event handler for LoadTodos
  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoading());

      final result = await getTodosUseCase();

      result.fold(
        (failure) => emit(TodoError(failure.errorMessage)),
        (todos) => emit(TodoLoaded(todos)),
      );
    } catch (e) {
      emit(TodoError('Failed to load todos'));
    }
  }

  // Event handler for AddTodo
  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      final result = await addTodoUseCase(event.params);

      result.fold(
        (failure) => emit(TodoError(failure.errorMessage)),
        (todo) {
          if (state is TodoLoaded) {
            final updatedTodos =
                List<TodoEntity>.from((state as TodoLoaded).todos)..add(todo);
            emit(TodoLoaded(updatedTodos));
          }
        },
      );
    } catch (e) {
      emit(TodoError('Failed to add todo'));
    }
  }

  // Event handler for DeleteTodo
  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoading());

      final result = await deleteTodoUseCase(event.id);

      result.fold(
        (failure) => emit(TodoError(failure.errorMessage)),
        (_) {
          if (state is TodoLoaded) {
            final updatedTodos = (state as TodoLoaded)
                .todos
                .where((todo) => todo.id != event.id)
                .toList();
            emit(TodoLoaded(updatedTodos));
          }
        },
      );
    } catch (e) {
      emit(TodoError('Failed to delete todo'));
    }
  }

  // Event handler for ToggleTodo
  Future<void> _onToggleTodo(ToggleTodo event, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoading());

      final result = await toggleTodoUseCase(event.id);

      result.fold(
        (failure) => emit(TodoError(failure.errorMessage)),
        (todo) {
          if (state is TodoLoaded) {
            final updatedTodos = (state as TodoLoaded)
                .todos
                .map((t) => t.id == todo.id ? todo : t)
                .toList();
            emit(TodoLoaded(updatedTodos));
          }
        },
      );
    } catch (e) {
      emit(TodoError('Failed to toggle todo'));
    }
  }
}
