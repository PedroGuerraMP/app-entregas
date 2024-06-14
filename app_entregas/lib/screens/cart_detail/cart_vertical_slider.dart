import 'package:flutter/material.dart';
import 'package:app_entregas/models/item.dart';

class CartVerticalSlider extends StatelessWidget {
  
  final List<Item> items; 
  final void Function() itemDetailOnClick;

  const CartVerticalSlider(this.items, this.itemDetailOnClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
                children: [
                TextButton(
                  onPressed: (){itemDetailOnClick();}, 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), 
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
                )
              ]
            );
          }
        );
  }

}