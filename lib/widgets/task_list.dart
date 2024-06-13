import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {
  List<Task> taskList;

  TaskList(this.taskList);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.taskList.length,
      itemBuilder: (context, int index) {
        return TaskTile(
            isChecked: widget.taskList[index].isDone,
            taskTile: widget.taskList[index].name,
            checkboxCallBack: (bool? checkboxState) {
              setState(() {
                widget.taskList[index].toggleDone();
              });
            });
      },
      // children: [
      //   TaskTile(isChecked: taskList[0].isDone, taskTile: taskList[0].name),
      //   TaskTile(isChecked: taskList[1].isDone, taskTile: taskList[1].name),
      //   TaskTile(isChecked: taskList[2].isDone, taskTile: taskList[2].name)
      // ],
    );
  }
}
