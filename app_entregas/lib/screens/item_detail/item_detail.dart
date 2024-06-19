import 'package:app_entregas/models/item.dart';
import 'package:app_entregas/screens/item_detail/item_detail_info.dart';
import 'package:app_entregas/screens/item_detail/item_image_stack.dart';
import 'package:app_entregas/screens/item_detail/detail_button_row.dart';
import 'package:app_entregas/data/items.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  ItemDetail(this.redirectToScaffoldMenu,this.redirectToCartDetail, {super.key});

  final void Function() redirectToScaffoldMenu;
  final void Function() redirectToCartDetail;
  
  Item item = listaItems[0];

  @override
  State<StatefulWidget> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DetailButtonRow(widget.redirectToCartDetail),
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
                  child: DetailItemInfo(widget.item.nome, widget.item.descricao, widget.item.preco.toString()),
                ),                
                const Divider(),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.item.adicionais[0].nome,
                          style: const TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                      ),

                    ],
                  )
                ),
                const SizedBox(height: 10,),
              ]
            ),
          ),
        ),
      )
    );
  }
}