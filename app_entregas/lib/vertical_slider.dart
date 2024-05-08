import 'package:flutter/material.dart';
import 'package:app_entregas/models/item.dart';

class VerticalSlider extends StatelessWidget {
  
  final List<Item> items; 
  
  const VerticalSlider(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [

                  Row(
                    children: [
                      (index == 0 || items[index].categoria != items[index-1].categoria) ? 
                        Column(children: [
                          const Divider(),
                          Text(items[index].categoria)
                        ]) : 
                        const SizedBox(height: 4,),
                    ]
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Image border
                        child: SizedBox.fromSize(
                          child: Image.asset( height: 60, 'assets/img/prato-0.jpg', ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items[index].nome),
                          Text(items[index].descricao),
                          const Text(""),
                        ]
                      ),
                      const Expanded(child: Text(""),),
                      Column(
                        children: [Text(items[index].preco)],
                      )
                    ],
                  )
                ]
            );
          }
        );
  }

}