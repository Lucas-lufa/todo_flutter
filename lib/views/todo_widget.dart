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
      margin: EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.green,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      // color: Theme.of(context).colorScheme.primaryContainer,
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
          Flexible(
            child: Center(
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(widget.todo.complete
                    ? Icons.favorite
                    : Icons.favorite_border),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//  (widget.index % 2 == 0)
//           ? const Color.fromARGB(255, 0, 188, 212)
//           : Colors.red