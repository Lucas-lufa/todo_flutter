import 'package:flutter/material.dart';
import 'package:ljf_todo/models/todo_list.dart';
import 'package:provider/provider.dart';

import './views/todo_widget.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoList(),
    child: const TodoApp(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const TodoHomePage(title: 'Todo Application'),
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          Consumer<TodoList>(builder: (context, model, child) {
            return Text('Completed ${model.completed} / ${model.todoCount}  ');
          }),
        ],
      ),
      body: Consumer<TodoList>(builder: (context, model, child) {
        return ListView.builder(
            itemCount: model.todoCount,
            itemBuilder: (BuildContext context, int index) {
              return TodoWidget(
                todo: model.todos[index],
                index: index,
              );
            });
      }),
    );
  }
} //_TodoHomePageState
