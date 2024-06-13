import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tile {
  final String text;
  bool isChecked; // Correct spelling

  Tile({required this.text, this.isChecked = false});

  void toggle() {
    isChecked = !isChecked;
  }
}

class TitleWidget extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Function(bool?) callBack;

  TitleWidget({
    required this.text,
    required this.isChecked,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: callBack,
      ),
    );
  }
}

class PartOfScreen extends StatefulWidget {
  const PartOfScreen({Key? key}) : super(key: key);

  @override
  State<PartOfScreen> createState() => _PartOfScreenState();
}

class _PartOfScreenState extends State<PartOfScreen> {
  List<Tile> tileWidgets = [
    Tile(text: 'text'),
    Tile(text: 'text'),
    Tile(text: 'text'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tileWidgets.length,
      itemBuilder: (context, index) {
        return TitleWidget(
          text: tileWidgets[index].text,
          isChecked: tileWidgets[index].isChecked, // Changed to isChecked
          callBack: (bool? newVal) {
            setState(() {
              tileWidgets[index].toggle();
            });
          },
        );
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PartOfScreen(),
      ),
    );
  }
}
