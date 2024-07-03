import 'package:app_entregas/models/pedido.dart';
import 'package:flutter/material.dart';

class CartVerticalSlider extends StatefulWidget {
  
  final Pedido pedido; 
  final void Function() itemDetailOnClick;
  List<(String, TextEditingController)> listaPedidoItemsControllers;

  CartVerticalSlider(this.pedido, this.itemDetailOnClick, this.listaPedidoItemsControllers, {super.key});
  
  @override
  State<StatefulWidget> createState() => _CartVerticalSliderState();
}

class _CartVerticalSliderState extends State<CartVerticalSlider> {
  
  late final Pedido pedido; 
  late final void Function() itemDetailOnClick;
  late List<(String, TextEditingController)> listaPedidoItemsControllers;


  @override
  void initState() {
    pedido = widget.pedido;
    itemDetailOnClick = widget.itemDetailOnClick;
    listaPedidoItemsControllers = widget.listaPedidoItemsControllers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      itemCount: pedido.items.length,
      itemBuilder: (BuildContext aContext, int pIndex) {
        return 
        Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: SizedBox.fromSize(
                    child: Image.asset( height: 60, 'assets/img/prato-0.jpg', ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                            pedido.items[pIndex].item.nome
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            pedido.items[pIndex].item.descricao
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: pedido.items[pIndex].listaAdicionais.length,
                            itemBuilder: (BuildContext bContext, int aIndex) {
                              return  ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                itemCount: pedido.items[pIndex].listaAdicionais[aIndex].quantidadeAdicionalItems.length,
                                itemBuilder: (BuildContext cContext, int aIIndex) {
                                  return 
                                  Row(
                                    children: [
                                      Text("+    ${pedido.items[pIndex].listaAdicionais[aIndex].quantidadeAdicionalItems[aIIndex].$2} x "),
                                      Text(
                                        overflow: TextOverflow.clip,
                                        pedido.items[pIndex].listaAdicionais[aIndex].quantidadeAdicionalItems[aIIndex].$1
                                      ),
                                    ]
                                  );
                                }
                              );
                            }
                          )
                        ]
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      iconSize: 15.0,
                      icon: Icon(
                        listaPedidoItemsControllers.firstWhere((element) => element.$1 == pedido.items[pIndex].item.nome).$2.value.text == "1"?
                        Icons.restore_from_trash_sharp : Icons.remove
                      ),
                      onPressed: () {
                        increment(listaPedidoItemsControllers.firstWhere((element) => element.$1 == pedido.items[pIndex].item.nome).$1, false);
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
                        Icons.add
                        ),
                      onPressed: () {
                        increment(listaPedidoItemsControllers.firstWhere((element) => element.$1 == pedido.items[pIndex].item.nome).$1, true);
                      },
                    )
                  ],
                ),
              ]
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("R\$${pedido.total}")
                ],
              ),
            ),
            const Divider()
          ]
        );
      }
    );
  }

   void increment(String key, bool positive) {
    int indexLista = listaPedidoItemsControllers.indexWhere((element) => element.$1 == key);

    if(indexLista == -1) {
      return;
    }

    var newValue = int.parse(listaPedidoItemsControllers[indexLista].$2.value.text);

    if(!positive && newValue == 1){
      pedido.items.removeAt(pedido.items.indexWhere((element) => element.item.nome == key));
    }
    else {
      positive ? newValue++ : newValue--;
      listaPedidoItemsControllers[indexLista].$2.value = TextEditingValue(text: newValue.toString());
    }
    
    setState(() {});
  }


}