import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTileWidget extends StatelessWidget {
  bool trueOrFalse;
  Function(bool? value) changeChackbox;

  MyTileWidget(
      { required this.trueOrFalse,
        required this.changeChackbox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('title'),
      trailing: Checkbox(
          value: trueOrFalse,
          onChanged: changeChackbox),
    );
  }
}
