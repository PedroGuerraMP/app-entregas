import 'package:flutter/material.dart';


class HorizontalSlider extends StatelessWidget {
  HorizontalSlider({super.key});

  final List<String> items = <String>['ITEM 1','ITEM 2','ITEM 3','ITEM 4',];
  final List<int> colorCodes = <int>[600, 500, 100, 200];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.all(8),
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index) {
      return  Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        color: Colors.amber[colorCodes[index]],
        child: Center(child: Text('Entry ${items[index]}')),
      );
      }
    );
  }
  
}