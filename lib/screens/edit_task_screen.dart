import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class EditTaskScreen extends StatelessWidget {
  int indexTaskEdit;
  EditTaskScreen(this.indexTaskEdit);

  TextEditingController textController = TextEditingController();

  void initState() {
    textController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    Data dataProvider = Provider.of<Data>(context);

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Edit Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: textController,
              onSubmitted: (text) {
                dataProvider.editTask(
                    dataProvider.tasks[indexTaskEdit], textController.text);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
            Container(
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  onPressed: () {
                    dataProvider.editTask(
                        dataProvider.tasks[indexTaskEdit], textController.text);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
