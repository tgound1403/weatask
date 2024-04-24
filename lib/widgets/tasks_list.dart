import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';
import 'package:flutter_todo_app/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_todo_app/screens/edit_task_screen.dart';

// ignore: use_key_in_widget_constructors
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, dataProvider, child) {
      return dataProvider.tasks.isNotEmpty ? ListView.separated(
              itemBuilder: (context, index) {
                final task = dataProvider.tasks[index];
                return TaskTile(
                  tileTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    dataProvider.checkTask(task);
                  },
                  deleteCallback: () => onDeleteTask(dataProvider, task),
                  editTaskCallback: () => onEditTask(context, index),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                    height: 8,
                  ),
              itemCount: dataProvider.tasksCount)
          : _buildEmptyUI();
    });
  }

  Widget _buildEmptyUI() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://icons.veryicon.com/png/o/miscellaneous/practical-life-icon/empty-24.png',
                width: 128,
                color: Colors.blueGrey),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Cùng lên kế hoạch cho hôm nay nào!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey),
            ),
          ],
        ));
  }

  void onEditTask(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom:
                    MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(index))));
  }

  void onDeleteTask(Data dataProvider, Task task) {
    dataProvider.deleteTask(task);
    Fluttertoast.showToast(
        msg: "Đã xóa việc '${task.name}'",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
