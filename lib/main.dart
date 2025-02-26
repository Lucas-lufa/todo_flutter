import 'package:flutter/material.dart';
import './models/todo.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoHomePage(title: 'Todo Application'),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key, required this.title});

  final String title;

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<Todo> _todos = <Todo>[
    Todo(
      name: 'Complete Assignment',
      description: 'Figure out how to write dart code.',
    ),
    Todo(name: 'Shopping', description: 'Pick up groceries'),
    Todo(name: 'Cook', description: 'Cook dinner with groceries'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int index) {
          return getTodoWidget(_todos[index]);
        },
      ),
    );
  }

  Widget getTodoWidget(Todo todo) {
    return Container(
      color: Colors.cyan,
      // color: () = (index % 2 == 0) Colors.cyan ?? Colors.red,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  todo.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  todo.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
