import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class Data extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Do homework'),
    Task(name: 'Do housework'),
    Task(name: 'Go to school'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView<Task>(_tasks);
  }

  void addTask(newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void checkTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  int get tasksCount => _tasks.length;

}