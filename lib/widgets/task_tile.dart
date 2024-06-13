import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTile;
  final Function(bool?) checkboxCallBack;

  TaskTile({super.key,
    required this.isChecked,
    required this.taskTile,
    required this.checkboxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTile,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          activeColor: Colors.cyanAccent,
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallBack(newValue);
          }),
    );
  }
}

// void checkboxCallBack(bool? checkboxState) {
//    setState(() {
//      isChecked = checkboxState ?? false;
//    });
//  }
