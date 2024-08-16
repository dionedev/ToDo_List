import 'package:flutter/material.dart';
import 'package:todo_app/pages/todolist_page.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'todoList',
      routes: {
        'todoList': (context) => const ToDoListPage(),
      },
    );
  }
}
