import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/task_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

