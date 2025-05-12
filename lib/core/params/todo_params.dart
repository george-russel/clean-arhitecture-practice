class TodoParams {
  final String title;
  final String id;
  final bool isDone;

  const TodoParams({
    required this.title,
    required this.id,
    this.isDone = false,
  });

  TodoParams copyWith({String? title, String? id, bool? isDone}) {
    return TodoParams(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
    );
  }
}
