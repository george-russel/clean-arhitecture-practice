import 'package:clean_architecture_practice/core/navigations/app_router.dart';
import 'package:clean_architecture_practice/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.goRouter,
      title: 'Clean Architecture Practice',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
