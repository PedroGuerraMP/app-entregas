import 'package:app_entregas/models/adicional_item.dart';
import 'package:app_entregas/models/item.dart';
import 'package:app_entregas/screens/item_detail/adicional_row.dart';
import 'package:app_entregas/screens/item_detail/item_detail_info.dart';
import 'package:app_entregas/screens/item_detail/item_image_stack.dart';
import 'package:app_entregas/screens/item_detail/detail_button_row.dart';
import 'package:app_entregas/data/items.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class ItemDetail extends StatefulWidget {
  ItemDetail(this.redirectToScaffoldMenu,this.redirectToCartDetail, {super.key});

  final void Function() redirectToScaffoldMenu;
  final void Function() redirectToCartDetail;
  
  Item item = listaItems[0];

  @override
  State<StatefulWidget> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail>{

  final TextEditingController _controllerPreco = TextEditingController(text: "1.00");
  late List<(String, AdicionalItem)> listaAdicionalItem;
  late List<(String, TextEditingController)> listaAdicionalController;
  final ItemScrollController itemScrollController = ItemScrollController();
  bool isValid = true;

  @override
  void initState() {
    isValid = !widget.item.adicionais.any((element) => element.eObrigatorio);
    listaAdicionalController = [];
    loadListaAdicionalItem();
    for (var element in listaAdicionalItem) {
      listaAdicionalController.add( (element.$2.nome, TextEditingController(text: "0")) );
    }
    super.initState();
  }


  @override
  void dispose() {
    listaAdicionalController = [];
    _controllerPreco.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DetailButtonRow(widget.redirectToCartDetail, itemScrollController, isValid),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ItemImageStack(widget.redirectToScaffoldMenu, 'assets/img/prato-teste.jpg'),
                const Divider( height: 0, ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: DetailItemInfo(widget.item.nome, widget.item.descricao, _controllerPreco),
                ),                
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 200,
                  child: AdicionalRow(widget.item, listaAdicionalItem, listaAdicionalController, itemScrollController, setListValid ),
                ),
                const SizedBox(height: 10,),
              ]
            ),
          ),
        ),
      )
    );
  }

  void loadListaAdicionalItem(){
    listaAdicionalItem = [];
    
    for (var adicional in widget.item.adicionais) {
      for (var item in adicional.items) {
        listaAdicionalItem.add( (adicional.nome, item) );
      }
    }
  }

  void setListValid(bool isListValid){
    isValid = isListValid;
    setState(() {});
  }

  
  }