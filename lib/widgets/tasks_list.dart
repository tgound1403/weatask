import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:flutter_todo_app/models/task_data.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<Data>(
      builder: (context, dataProvider, child) {
        return ListView.builder(itemBuilder: (context, index) {
          final task = dataProvider.tasks[index];
          return TaskTile(
              tileTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                dataProvider.checkTask(task);
              },
              deleteCallback: () {
                print("Pressed");
                dataProvider.deleteTask(task);
              },
          );

        }, itemCount: dataProvider.tasksCount);
      }
    );
  }
}
