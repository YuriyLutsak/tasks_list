import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'text',
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: TaskCheckbox(
        checkingValue: isChecked,
        changingVal: (bool? trueOrFalse) {
          setState(() {
            isChecked = trueOrFalse!;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  //  в StatelessWidget все поля должны быть final для того,
  //  чтоб определить их в конструкторе
  final bool checkingValue;
  final Function(bool? trueOrFalse) changingVal;

  const TaskCheckbox(
      {super.key, required this.checkingValue, required this.changingVal});

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: checkingValue, onChanged: changingVal);
  }
}

// void checkboxCallBack(bool? checkboxState) {
//    setState(() {
//      isChecked = checkboxState ?? false;
//    });
//  }