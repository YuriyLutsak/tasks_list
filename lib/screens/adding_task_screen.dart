import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Function(String taskTitle) addTask;

  AddTask(this.addTask);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Center(
      // ОБЯЗВТЕЛЬНО ОБРАМЛЯЕМ В Center. потому что будет по размеру childa
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
        child: Column(
          children: [
            Text('ADD THE TASK'),
            TextField(
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addTask(newTaskTitle!);
              },
              child: Text('add'),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.cyanAccent),
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
