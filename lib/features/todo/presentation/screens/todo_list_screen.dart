import 'package:clean_architecture_practice/core/params/todo_params.dart';
import 'package:clean_architecture_practice/core/utils/app_colors.dart';
import 'package:clean_architecture_practice/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:clean_architecture_practice/features/todo/presentation/bloc/todo_event.dart';
import 'package:clean_architecture_practice/features/todo/presentation/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.todoColors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          } else if (state is TodoLoaded) {
            final todos = state.todos;
            if (todos.isEmpty) {
              return const Center(child: Text('No todos yet.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                final bgColor = colors[index % colors.length];
                const textColor = Colors.black87;
                print('TODO ID ${todo.id}');
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    leading: Icon(
                      todo.isDone
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: todo.isDone
                          ? Colors.green.shade700
                          : Colors.grey.shade800,
                      size: 30,
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
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
                      icon: const Icon(Icons.delete_outline,
                          color: Colors.redAccent),
                      onPressed: () {
                        context.read<TodoBloc>().add(DeleteTodo(todo.id));
                      },
                    ),
                    onTap: () {
                      print('PRINTT::::');
                      print('ID ${todo.id}');
                      context.read<TodoBloc>().add(ToggleTodo(todo.id));
                    },
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter todo title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = controller.text.trim();
                if (title.isNotEmpty) {
                  context.read<TodoBloc>().add(AddTodo(TodoParams(
                      title: title,
                      id: DateTime.now().microsecondsSinceEpoch.toString())));
                }
                Navigator.of(ctx).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
