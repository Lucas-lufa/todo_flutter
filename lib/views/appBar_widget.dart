import 'package:flutter/material.dart';

import '../models/todo.dart';

class AppBarTodoWidget extends StatefulWidget {
  final Todo todo;
  final int index;
  const AppBarTodoWidget({super.key, required this.todo, this.index = 0});

  @override
  State<AppBarTodoWidget> createState() => _AppBarTodoWidgetState();
}

class _AppBarTodoWidgetState extends State<AppBarTodoWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
