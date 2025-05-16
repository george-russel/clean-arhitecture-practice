import 'package:clean_architecture_practice/app_list.dart';
import 'package:clean_architecture_practice/core/services/service_locator.dart';
import 'package:clean_architecture_practice/core/utils/app_routes.dart';
import 'package:clean_architecture_practice/features/login/domain/usecases/get_profile.dart';
import 'package:clean_architecture_practice/features/login/domain/usecases/login.dart';
import 'package:clean_architecture_practice/features/login/presentation/bloc/login_bloc.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/add_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/login/presentation/screens/login.dart';
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
        path: AppRoutes.todoScreen,
        name: 'todoScreen',
        builder: (context, state) {
          return BlocProvider(
            create: (_) {
              return TodoBloc(
                getTodosUseCase: locator<GetTodoUseCase>(),
                addTodoUseCase: locator<AddTodoUseCase>(),
                deleteTodoUseCase: locator<DeleteTodoUseCase>(),
                toggleTodoUseCase: locator<ToggleTodoUseCase>(),
              )..add(LoadTodos());
            },
            child: const TodoListScreen(),
          );
        },
      ),
      GoRoute(
          path: AppRoutes.loginScreen,
          name: 'loginScreen',
          builder: (context, state) => BlocProvider(
              create: (_) {
                return LoginBloc(
                    loginUseCase: locator<LoginUseCase>(),
                    getProfileUseCase: locator<GetProfileUseCase>());
              },
              child: const LoginScreen()))
    ],
  );
}
