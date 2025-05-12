import 'dart:math';

import 'package:clean_architecture_practice/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = [
      {'title': 'Buy groceries', 'done': false},
      {'title': 'Walk the dog', 'done': true},
      {'title': 'Write clean architecture demo', 'done': false},
      {'title': 'Call mom', 'done': false},
    ];

    final colors = AppColors.todoColors;

    final rnd = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          final isDone = todo['done'] as bool;
          final bgColor = colors[index % colors.length];
          const textColor = Colors.black87;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: bgColor.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              leading: Icon(
                isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isDone ? Colors.green.shade700 : Colors.grey.shade800,
                size: 30,
              ),
              title: Text(
                todo['title'] as String,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: isDone ? TextDecoration.lineThrough : null,
                  color: textColor,
                ),
              ),
              subtitle: Text(
                'Due: Tomorrow',
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 13,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: () {
                  // To implement: Delete
                },
              ),
              onTap: () {
                // To implement: Toggle done status
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // To implement: Add new todo
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
      ),
    );
  }
}
