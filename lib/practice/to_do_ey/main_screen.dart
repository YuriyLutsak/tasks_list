import 'package:flutter/cupertino.dart';
import 'package:todoey/practice/to_do_ey/widgets/tile_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool falseOrTrue = false;

  Set<int> trueValue = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return MyTileWidget(
              trueOrFalse: trueValue.contains(index),
              changeChackbox: (newVal) {
                setState(() {
                  if(newVal!){
                  trueValue.add(index);}
                  else {
                    trueValue.remove(index);
                  }
                });
              },
            );
          }),
    );
  }
}
