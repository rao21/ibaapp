import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var _data = [
  TileDataModel(subTitle: "Flutter best for material design", title: "Flutter"),
  TileDataModel(
      subTitle: "Flutter best for material design", title: "Flutter 1"),
  TileDataModel(
      subTitle: "Flutter best for material design", title: "Flutter 2"),
];

class TileDataModel {
  TileDataModel({required this.subTitle, required this.title});
  final String title;
  final String subTitle;
}

class FLutterList extends StatelessWidget {
  const FLutterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int i) {
            var obj = _data[i];
            return _item(obj);
          },
        ),
      ),
    );
  }

  Widget _item(TileDataModel obj) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(obj.title),
        subtitle: Text(obj.subTitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notification_add,
              size: 16,
            ),
            Icon(Icons.notification_add, size: 16),
          ],
        ),
      ),
    );
  }
}
