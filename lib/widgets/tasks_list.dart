import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:flutter_todo_app/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_todo_app/screens/edit_task_screen.dart';

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
                Fluttertoast.showToast(
                    msg: "Task '${task.name}' is deleted",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
            editTaskCallback: (){
              showModalBottomSheet(context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: EditTaskScreen(index))));
            },
          );

        }, itemCount: dataProvider.tasksCount);
      }
    );
  }
}
