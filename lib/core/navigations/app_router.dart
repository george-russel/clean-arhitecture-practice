import 'package:clean_architecture_practice/app_list.dart';
import 'package:clean_architecture_practice/features/todo/data/respositories/todo_repository_impl.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/add_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/todo/data/datasources/todo_local_data_source.dart';
import '../../features/todo/domain/usecases/delete_todo.dart';
import '../../features/todo/domain/usecases/get_todo.dart';
import '../../features/todo/domain/usecases/toggle_todo.dart';
import '../../features/todo/presentation/bloc/todo_bloc.dart';
import '../../features/todo/presentation/bloc/todo_event.dart';
import '../../features/todo/presentation/screens/todo_list_screen.dart';

class AppRouter {
  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'appList',
        builder: (context, state) => const AppList(),
      ),
      GoRoute(
        path: '/todo',
        name: 'todo',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => TodoBloc(
              getTodosUseCase: GetTodoUseCase(
                  repository:
                      TodoRepositoryImpl(dataSource: TodoDataSourceImpl())),
              addTodoUseCase: AddTodoUseCase(
                  repository:
                      TodoRepositoryImpl(dataSource: TodoDataSourceImpl())),
              deleteTodoUseCase: DeleteTodoUseCase(
                  repository:
                      TodoRepositoryImpl(dataSource: TodoDataSourceImpl())),
              toggleTodoUseCase: ToggleTodoUseCase(
                  repository:
                      TodoRepositoryImpl(dataSource: TodoDataSourceImpl())),
            )..add(LoadTodos()),
            child: const TodoListScreen(),
          );
        },
      ),
    ],
  );
}
