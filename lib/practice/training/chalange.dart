import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/practice/adding_tile_to_list_builder_explanation/all_in_one.dart';

class Tile {
  final String text;
  bool isChecked;

  Tile({required this.text, this.isChecked = false});

  void toggle() {
    isChecked = !isChecked;
  }
}

class TitleWidget extends StatelessWidget {
  String text;
  bool isChecked;
  Function(bool? val) callBack;

  TitleWidget(
      {required this.text, required this.isChecked, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: callBack,
      ),
    );
  }
}

class PartOfScreen extends StatefulWidget {
  const PartOfScreen({super.key});

  @override
  State<PartOfScreen> createState() => _PartOfScreenState();
}

class _PartOfScreenState extends State<PartOfScreen> {
  //Я возвращаю лист объектов но строю виджет в методе build
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
          //Я возвращаю лист объектов но строю виджет в методе build
          return TileWidget(
              text: tileWidgets[index].text,
              isCheck: tileWidgets[index].isChecked,
              callBack: (bool? newVal) {
                setState(() {
                  tileWidgets[index].toggle();
                });
                print('object');
              });
        });
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PartOfScreen(),
      ),
    );
  }
}
