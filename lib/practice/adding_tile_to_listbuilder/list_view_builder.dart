import 'package:flutter/cupertino.dart';
import 'package:todoey/practice/adding_tile_to_listbuilder/widget_of_tile.dart';

import 'model_of_tile.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({super.key});

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    List<TileModel> tileModels = [];

    return ListView.builder(itemBuilder: (context, int index) {
      return Tile(
          titleOfTile: tileModels[index].name,
          isChecked: tileModels[index].isDone,
          callBackFunc: (state) {
            tileModels[index].toggle();
          });
    });
  }
}
