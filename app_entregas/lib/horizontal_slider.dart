import 'package:flutter/material.dart';

class HorizontalSlider extends StatelessWidget {
  HorizontalSlider({super.key});

  final List<String> titulos = <String>['TIT 1','TITULO 2','TITULO 3','TITULO 4','TITULO  5'];
  final List<String> items = <String>['ITEM 1','ITEM 2','ITEM 3','ITEM 4','ITEM 5'];
  final String preco = '20,00';
  final List<int> colorCodes = <int>[600, 500, 300, 200, 100,  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return  Container(
                padding: const EdgeInsets.all(8),
                // color: Colors.amber[colorCodes[index]],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10), // Image border
                          child: SizedBox.fromSize(
                            child: Image.asset( height: 50, 'assets/img/prato-0.jpg', ),
                          ),
                        ),
                        Text(style: const TextStyle(fontSize: 14),textAlign: TextAlign.start,
                          titulos[index]
                        ),
                        Text(style: const TextStyle(fontSize: 12), textAlign: TextAlign.start,
                          items[index]
                        ),
                      ],
                    ),
                    Text(style: const TextStyle(fontSize: 12), textAlign: TextAlign.start,
                      preco
                    ),
                  ],
                )
              );
            }
          );
  }
  
}