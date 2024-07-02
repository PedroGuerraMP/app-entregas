import 'package:app_entregas/models/adicional.dart';
import 'package:app_entregas/models/adicional_item.dart';
import 'package:app_entregas/models/item.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class AdicionalRow extends StatefulWidget {
  const AdicionalRow(this.item, this.listaAdicionalItem, this.listaAdicionalController, this.itemScrollController, {super.key});

  final ItemScrollController itemScrollController;
  final Item item;
  final List<(String, AdicionalItem)> listaAdicionalItem;
  final List<(String, TextEditingController)> listaAdicionalController;


  @override
  State<StatefulWidget> createState() => _AdicionalRowState();
}

class _AdicionalRowState extends State<AdicionalRow>{

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemScrollController: widget.itemScrollController,
            itemCount: widget.listaAdicionalItem.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (index == 0 || widget.listaAdicionalItem[index].$1 != widget.listaAdicionalItem[index-1].$1)?
                  const Divider() : const SizedBox(),
                  (index == 0 || widget.listaAdicionalItem[index].$1 != widget.listaAdicionalItem[index-1].$1)?
                  Text(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: adicionalIsValid(widget.listaAdicionalItem[index].$1)? Colors.black : Colors.red),
                    widget.listaAdicionalItem[index].$1,) : const SizedBox(),                             
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(style: const TextStyle(fontWeight: FontWeight.w700), widget.listaAdicionalItem[index].$2.nome),
                            Text("R\$${widget.listaAdicionalItem[index].$2.preco}"),
                          ],
                        )
                      ),      
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          increment(widget.listaAdicionalItem[index].$2.nome, false);
                        },
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: const UnderlineInputBorder(), counter: Container()),
                          controller: widget.listaAdicionalController.firstWhere((element) => element.$1 == widget.listaAdicionalItem[index].$2.nome).$2,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          increment(widget.listaAdicionalItem[index].$2.nome, true);
                        },
                      )
                    ],
                  ),
                ]
              );
            }
          );
  }

  void increment(String key, bool positive) {
    int indexLista = widget.listaAdicionalController.indexWhere((element) => element.$1 == key);

    if (int.tryParse(widget.listaAdicionalController[indexLista].$2.value.text)! > 0) {
      var newValue = int.parse(widget.listaAdicionalController[indexLista].$2.value.text);
      positive ? newValue++ : newValue--;

      widget.listaAdicionalController[indexLista].$2.value = TextEditingValue(text: newValue.toString());
    }
    else{
      if(positive){
        widget.listaAdicionalController[indexLista].$2.value = const TextEditingValue(text: "1");
      }
    }
    setState(() {});
  }
  
  adicionalIsValid(String nomeAdicional){
    int quantidade = 0;
    Adicional adicional = widget.item.adicionais
                            .firstWhere((element) => element.nome == nomeAdicional);
    List<(String, TextEditingController)> lista =  widget.listaAdicionalController.where((element) => adicional.items.any((item) => item.nome == element.$1) ).toList();
    for (var element in lista) {
      quantidade += int.parse(element.$2.value.text);
    }
    
    if(adicional.eObrigatorio && quantidade == 0){
      return false;
    }
    else if(adicional.minimo > quantidade){
      return false;
    }
    else if(adicional.maximo != 0 && adicional.maximo < quantidade){
      return false;
    }
    else{
      return true;
    }
  }
}