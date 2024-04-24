import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/tasks_list.dart';
import 'package:flutter_todo_app/screens/add_task_screen.dart';
import 'package:flutter_todo_app/models/task_data.dart';
import 'package:flutter_todo_app/widgets/weather.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/widgets/tip_card.dart';

class TasksScreen extends StatelessWidget {
  final locationData;
  TasksScreen(this.locationData);

  @override
  Widget build(BuildContext context) {
    Data dataProvider = Provider.of<Data>(context);
    return Scaffold(
      floatingActionButton: _buildFAB(context),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection(dataProvider),
          const SizedBox(
            height: 24,
          ),
          _buildTasksSection()
        ],
      ),
    );
  }

  Widget _buildTasksSection() {
    return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: TasksList(),
        ));
  }

  Widget _buildInfoSection(Data dataProvider) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WeatherWidget(
              locationWeather: locationData,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TipCard(displayText: "${dataProvider.tasksCount - dataProvider.getTaskDone(dataProvider.tasks)} việc cần làm",),
                  TipCard(displayText: "Đã hoàn thành ${dataProvider.getTaskDone(dataProvider.tasks)}",)
                ]),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightBlueAccent,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen())));
      },
    );
  }
}
