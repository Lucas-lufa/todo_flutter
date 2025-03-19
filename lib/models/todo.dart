class Todo {
  final String id;
  final String name;
  final String description;
  final bool complete;

  Todo(
      {required this.id,
      required this.name,
      required this.description,
      this.complete = false});

  @override
  String toString() {
    return "$name - ($description)";
  }

  Todo copyWith(
      {String? newId,
      String? newName,
      String? newDescription,
      bool? complete}) {
    return Todo(
        id: newId ?? id,
        name: newName ?? name,
        description: newDescription ?? description,
        complete: complete ?? this.complete);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'complete': complete,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    bool? complete = map['complete'] is bool ? map['complete'] : null;

    complete ??= map['complete'] == 1 ? true : false;

    return Todo(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      complete: complete,
    );
  }
}
