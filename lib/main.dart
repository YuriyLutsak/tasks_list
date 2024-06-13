import 'package:flutter/material.dart';
import 'package:todoey/practice/to_do_ey/main_screen.dart';
import 'package:todoey/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: TaskScreen(),);
    return MaterialApp(
      home: Scaffold(body: MainScreen(),),
    );
  }
}
