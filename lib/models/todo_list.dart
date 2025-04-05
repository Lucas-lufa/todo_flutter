import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ljf_todo/services/i_data_source.dart';
import 'todo.dart';

// this is our state object - contains our data
class TodoList extends ChangeNotifier {
  final List<Todo> _todos = <Todo>[
    Todo(
      id: 1,
      name: 'Complete Assignment',
      description: 'Figure out how to write dart code.',
      complete: true,
    ),
    Todo(
      id: 3,
      name: 'Shopping',
      description: 'Pick up groceries',
      complete: false,
    ),
    Todo(
      id: 4,
      name: 'Cook',
      description: 'Cook dinner with groceries',
      complete: false,
    ),
    Todo(
      id: 5,
      name: 'Cook',
      description: 'Cook dinner with groceries',
      complete: false,
    ),
    Todo(
      id: 6,
      name: 'Cook',
      description: 'Cook dinner with groceries',
      complete: true,
    ),
  ];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  int get todoCount => _todos.length;
  int get completed {
    return _todos.where((todo) => todo.complete).length;
  }

  void Add(Todo todo) async {
    IDataSource dataSource = Get.find();
    await dataSource.add(todo);
    await Refresh();
    // _todos.insert(index, todo);
  }

  void RemoveAll() {
    _todos.clear();
    notifyListeners();
  }

  void Remove(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void UpdateTodo(
    Todo todo,
    int index,
    String? name,
    String? description,
    bool? complete,
  ) async {
    IDataSource dataSource = Get.find();
    await dataSource.edit(todo, name, description, complete);
    _todos[index] = todo;
    notifyListeners();
  }

  Future<List<Todo>> Refresh() async {
    IDataSource dataSource = Get.find();
    RemoveAll();
    _todos.addAll(await dataSource.browse());
    notifyListeners();
    return todos;
  }
}
