class TileModel {
  final String name;
  bool isDone;

  TileModel({required this.name, this.isDone = false});

  void toggle() {//переключать
    isDone = !isDone;
  }
}
