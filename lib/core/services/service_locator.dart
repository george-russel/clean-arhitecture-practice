import 'package:clean_architecture_practice/features/login/data/datasources/login_data_source.dart';
import 'package:clean_architecture_practice/features/login/data/repositories/login_repository_impl.dart';
import 'package:clean_architecture_practice/features/login/domain/repositories/login_repository.dart';
import 'package:clean_architecture_practice/features/login/domain/usecases/get_profile.dart';
import 'package:clean_architecture_practice/features/login/domain/usecases/login.dart';
import 'package:clean_architecture_practice/features/todo/data/datasources/todo_data_source.dart';
import 'package:clean_architecture_practice/features/todo/domain/respositories/todo_repository.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/add_todo.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/delete_todo.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/get_todo.dart';
import 'package:clean_architecture_practice/features/todo/domain/usecases/toggle_todo.dart';
import 'package:get_it/get_it.dart';

import '../../features/todo/data/respositories/todo_repository_impl.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  _repositories();
  _dataSources();
  _useCases();
}

void _repositories() {
  locator.registerLazySingleton<TodoRepositoryInternal>(
      () => TodoRepositoryImpl(dataSource: locator<TodoDataSource>()));
  locator.registerLazySingleton<TodoRepository>(
      () => locator<TodoRepositoryInternal>());
  locator.registerLazySingleton<LoginRepositoryInternal>(
      () => LoginRepositoryImpl(dataSource: locator<LoginDataSource>()));
  locator.registerLazySingleton<LoginRepository>(
      () => locator<LoginRepositoryInternal>());
}

void _dataSources() {
  locator.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl());
  locator.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
}

void _useCases() {
  /// Todo Use Cases
  locator.registerLazySingleton(
      () => AddTodoUseCase(repository: locator<TodoRepositoryInternal>()));
  locator.registerLazySingleton(
      () => GetTodoUseCase(repository: locator<TodoRepositoryInternal>()));
  locator.registerLazySingleton(
      () => DeleteTodoUseCase(repository: locator<TodoRepositoryInternal>()));
  locator.registerLazySingleton(
      () => ToggleTodoUseCase(repository: locator<TodoRepositoryInternal>()));

  /// Login Use Cases
  locator.registerLazySingleton(
      () => LoginUseCase(repository: locator<LoginRepositoryInternal>()));
  locator.registerLazySingleton(
      () => GetProfileUseCase(repository: locator<LoginRepositoryInternal>()));
}
