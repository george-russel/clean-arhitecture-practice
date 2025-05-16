import '../../domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    String? id,
    String? title,
    bool? isDone,
  }) : super(id: id ?? '', title: title ?? '', isDone: isDone ?? false);

  @override
  TodoModel copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
