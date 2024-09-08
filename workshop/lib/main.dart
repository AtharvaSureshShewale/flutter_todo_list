import 'package:flutter/material.dart';
import 'package:workshop/screens/add_task.dart';
import 'package:workshop/screens/todo_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoTask(),
    );
  }
}

