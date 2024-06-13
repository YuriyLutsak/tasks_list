// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// //Less это коробка для модели которая рисует нашу модель, где логика,
// // а full вызывает изменения в логике модели с помощью сет стейт
// //Stateless - это картинка и в неё мы можем засунуть любой объект ,а это json.
//
// //============================================
//
// //я сделал виджет для того чтобы в него потом засунуть данные объекта
// //Виджет - это картинка которая хранит в себе данные объекта но не имеет своих данных
// class TileWidget extends StatelessWidget {
//   final String text;
//   bool isCheck;
//   final Function(bool? newValue) callBack;
//
//   TileWidget(
//       {required this.text, required this.isCheck, required this.callBack});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         text,
//         style:
//             TextStyle(decoration: isCheck ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(value: isCheck, onChanged: callBack),
//     );
//   }
// }
//
// //объект нужен чтоб засовывать в виджет данные и писать логику
// class TileModel {
//   final String text;
//   bool isCheck;
//
//   void toogle() {
//     isCheck = !isCheck;
//   }
//
//   TileModel({required this.text, this.isCheck = false});
// }
//
// class ListBuilder extends StatefulWidget {
//   const ListBuilder({super.key});
//
//   @override
//   State<ListBuilder> createState() => _ListBuilderState();
// }
//
// class _ListBuilderState extends State<ListBuilder> {
//   @override
//   Widget build(BuildContext context) {
//     //лист нужен чтоб хранить много объектов
//     List<TileModel> models = [
//       TileModel(text: 'text'),
//       TileModel(text: 'text'),
//       TileModel(text: 'text'),
//     ];
//     return ListView.builder(
//         itemCount: models.length,
//         itemBuilder: (context, index) {
//           //я сделал виджет для того чтобы в него потом засунуть данные объекта
//           //объект нужен чтоб засовывать в виджет данные
//           return TileWidget(
//               text: models[index].text,
//               isCheck: models[index].isCheck,
//               callBack: (bool? state) {
//                 setState(() {
//                   models[index].toogle();
//                 });
//               });
//         });
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListBuilder(),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileModel {
  final String text;
  bool isChecked;

  TileModel({required this.text, this.isChecked = false});

  void toggle() {
    isChecked = !isChecked;
  }
}

class TileWidget extends StatelessWidget {
  final String text;
  final bool isCheck;
  final Function(bool? newValue) callBack;

  TileWidget({
    required this.text,
    required this.isCheck,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          decoration: isCheck ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isCheck,
        onChanged: callBack,
      ),
    );
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({Key? key}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  List<TileModel> tileModels = [
    TileModel(text: 'text1'),
    TileModel(text: 'text2'),
    TileModel(text: 'text3'),
  ];


  // differrents
  void toggleTile(int index) {
    setState(() {
      tileModels[index].toggle();
    });
  }
//=================================
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tileModels.length,
      itemBuilder: (context, index) {
        return TileWidget(
          text: tileModels[index].text,
          isCheck: tileModels[index].isChecked,
          callBack: (bool? newValue) {
            toggleTile(index);
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
        body: ListBuilder(),
      ),
    );
  }
}
