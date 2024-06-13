import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String titleOfTile;
  final bool isChecked;
  final Function(bool?) callBackFunc;

  const Tile(
      {super.key,
      required this.titleOfTile,
      required this.isChecked,
      required this.callBackFunc});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleOfTile),
      trailing: Checkbox.adaptive(value: isChecked, onChanged: callBackFunc),
    );
  }
}
