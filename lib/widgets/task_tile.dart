import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String tileTitle;
  final bool isChecked;
  final Null Function(dynamic) checkboxCallback;
  final Function() deleteCallback;
  final Function() editTaskCallback;

  // ignore: use_key_in_widget_constructors
  const TaskTile(
      {required this.isChecked,
      required this.tileTitle,
      required this.checkboxCallback,
      required this.deleteCallback,
      required this.editTaskCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isChecked ? Colors.blueGrey.shade50 : Colors.blueGrey.shade100
      ),
      padding: const EdgeInsets.all(4),
      child: ListTile(
        title: Text(
          tileTitle,
          style: TextStyle(
              fontSize: 20,
              color: isChecked ? Colors.black26 : Colors.black,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        onTap: editTaskCallback,
        trailing: Checkbox(
          activeColor: Colors.black26,
          value: isChecked,
          onChanged: checkboxCallback,
          checkColor: isChecked ? Colors.blueGrey.shade50 : Colors.blueGrey.shade100,
        ),
        onLongPress: deleteCallback,
      ),
    );
  }
}
