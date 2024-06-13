
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return MyTileWidget(
            trueOrFalse: isChecked,
            changeCheckbox: (newVal) {
              setState(() {
                isChecked = newVal!;
              });
            },
          );
        },
      ),
    );
  }
}

class MyTileWidget extends StatelessWidget {
  final bool trueOrFalse;
  final Function(bool? value) changeCheckbox;

  MyTileWidget({
    required this.trueOrFalse,
    required this.changeCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    bool isChecked = trueOrFalse;

    return ListTile(
      title: Text('Title'),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {
          isChecked = value!;
          changeCheckbox(value);
        },
      ),
    );
  }
}

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