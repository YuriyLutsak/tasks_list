import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/screens/adding_task_screen.dart';
import 'package:todoey/widgets/task_list.dart';

import '../models/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // Widget buildButtonSheet(BuildContext context) {
  List<Task> taskList = [
    Task(name: 'buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'buy bread')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 40,
                  ),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Todoey',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                Text('${taskList.length} tasks'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TaskList(taskList),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.cyanAccent,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddTask((newTaskTitle) {
                          setState(() {
                            taskList.add(Task(name: newTaskTitle));
                            taskList.insert(0, Task(name: newTaskTitle));
                          });
                          Navigator.pop(context);
                        }),
                      ),
                    ),
                isScrollControlled: true);
// buildButtonSheet its the same that (context) { return Container();}
          }),
    );
  }
}
