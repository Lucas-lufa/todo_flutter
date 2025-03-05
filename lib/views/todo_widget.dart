import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;
  final int index;
  const TodoWidget({super.key, required this.todo, this.index = 0});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.index % 2 == 0)
          ? const Color.fromARGB(255, 0, 188, 212)
          : Colors.red,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  widget.todo.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  widget.todo.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
