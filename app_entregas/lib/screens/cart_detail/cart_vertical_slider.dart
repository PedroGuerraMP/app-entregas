import 'dart:ffi';

import 'package:app_entregas/models/pedido.dart';
import 'package:flutter/material.dart';
import 'package:app_entregas/models/item.dart';
import 'package:flutter/widgets.dart';

class CartVerticalSlider extends StatelessWidget {
  
  final Pedido pedido; 
  final void Function() itemDetailOnClick;
  List<(String, TextEditingController)> listaPedidoItemsControllers;

  CartVerticalSlider(this.pedido, this.itemDetailOnClick, this.listaPedidoItemsControllers, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          itemCount: pedido.items.length,
          itemBuilder: (BuildContext aContext, int pIndex) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.33,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.36,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                                  pedido.items[pIndex].item.nome
                                )
                              ),
                            ] 
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.3,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                pedido.items[pIndex].item.descricao),
                            ),
                            SizedBox(
                              height: 160,
                              width: MediaQuery.of(context).size.width*0.3,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: pedido.items[pIndex].listaAdicionais.length,
                                itemBuilder: (BuildContext bContext, int aIndex) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width*0.3,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                      itemCount: pedido.items[pIndex].listaAdicionais[aIndex].quantidadeAdicionalItems.length,
                                      itemBuilder: (BuildContext cContext, int aIIndex) {
                                        return Row(
                                          children: [
                                            Text(
                                              "+    ${pedido.items[pIndex].listaAdicionais[aIndex].quantidadeAdicionalItems[aIIndex].$2} x "
                                            ),
                                            Text(
                                              overflow: TextOverflow.clip,
                                              pedido.items[pIndex].listaAdicionais[aIndex].quantidadeAdicionalItems[aIIndex].$1
                                            ),
                                          ]
                                        );
                                      }
                                    )
                                  );
                                }
                              )
                            ),
                          ]
                        ),
                      ],
                    ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.15,
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 15.0,
                        icon: const Icon(
                          Icons.remove),
                        onPressed: () {
                          increment("", false);
                        },
                      ),
                      SizedBox(
                        width: 11,
                        child: TextField(
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(border: InputBorder.none),
                          controller: listaPedidoItemsControllers.firstWhere((element) => element.$1 == pedido.items[pIndex].item.nome).$2,
                        ),
                      ),
                      IconButton(
                        iconSize: 15.0,
                        icon: const Icon(
                          Icons.add),
                        onPressed: () {
                          increment("", true);
                        },
                      )
                    ],
                  ),
                )
              ]
            );
          }
        );
  }

   void increment(String key, bool positive) {
    // int indexLista = widget.listaAdicionalController.indexWhere((element) => element.$1 == key);

    // if (int.tryParse(widget.listaAdicionalController[indexLista].$2.value.text)! > 0) {
    //   var newValue = int.parse(widget.listaAdicionalController[indexLista].$2.value.text);
    //   positive ? newValue++ : newValue--;

    //   widget.listaAdicionalController[indexLista].$2.value = TextEditingValue(text: newValue.toString());
    // }
    // else{
    //   if(positive){
    //     widget.listaAdicionalController[indexLista].$2.value = const TextEditingValue(text: "1");
    //   }
    // }
    // validateList();
    // setState(() {});
  }

}