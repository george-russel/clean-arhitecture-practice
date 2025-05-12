import 'package:clean_architecture_practice/app_list.dart';
import 'package:clean_architecture_practice/core/utils/app_routes.dart';
import 'package:go_router/go_router.dart';

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
          builder: (context, state) => const TodoListScreen())
    ],
  );
}
