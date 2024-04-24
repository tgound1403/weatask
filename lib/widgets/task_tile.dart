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
    return Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isChecked ? Colors.blueGrey.shade50 : Colors.blueGrey.shade100),
        padding: const EdgeInsets.all(4),
        child: ListTile(
          title: Text(
            tileTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
            checkColor:
                isChecked ? Colors.blueGrey.shade50 : Colors.blueGrey.shade100,
          ),
          onLongPress: deleteCallback,
        ),
      ),
      // Transform.translate(
      //   offset: const Offset(12, - 12),
      //   child: Container(
      //     padding: const EdgeInsets.all(4),
      //     decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(32)),
      //     child: const Icon(Icons.delete_rounded, color: Colors.white, size: 18,),
      //   ),
      // ),
    ]);
  }
}
