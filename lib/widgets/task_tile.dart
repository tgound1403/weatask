import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String tileTitle;
  final bool isChecked;
  final Null Function(dynamic) checkboxCallback;
  final Function() deleteCallback;

  // ignore: use_key_in_widget_constructors
  const TaskTile(
      {required this.isChecked,
      required this.tileTitle,
      required this.checkboxCallback,
      required this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tileTitle,
        style: TextStyle(
            fontSize: 18,
            color: isChecked == true ? Colors.black26 : Colors.black,
            decoration: isChecked == true ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.black26,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: deleteCallback,
    );
  }
}
