import 'package:clean_architecture_practice/core/utils/app_routes.dart';
import 'package:clean_architecture_practice/shared/widgets/primary_button.dart';
import 'package:clean_architecture_practice/shared/widgets/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppList extends StatelessWidget {
  const AppList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 50),
          child: Column(
            children: [
              const Center(
                  child: Text(
                'App List',
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                label: 'Todo App',
                onPressed: () => context.push(AppRoutes.todoScreen),
              ),
              PrimaryButton(
                label: 'Login',
                onPressed: () => context.push(AppRoutes.loginScreen),
              )
            ],
          ),
        ),
      ),
    );
  }
}
