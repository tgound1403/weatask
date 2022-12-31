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
      floatingActionButton: FloatingActionButton(
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
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 30, bottom: 30, right: 30),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  WeatherWidget(
                    locationWeather: locationData,
                  ),
                  const SizedBox(
                    height: 5,
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
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          ))
        ],
      ),
    );
  }
}
