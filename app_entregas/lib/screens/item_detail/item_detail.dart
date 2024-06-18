import 'package:app_entregas/screens/item_detail/item_detail_info.dart';
import 'package:app_entregas/screens/item_detail/item_image_stack.dart';
import 'package:flutter/material.dart';
import 'package:app_entregas/screens/item_detail/detail_button_row.dart';

class ItemDetail extends StatefulWidget {
  ItemDetail(this.redirectToScaffoldMenu,this.redirectToCartDetail, {super.key});

  final void Function() redirectToScaffoldMenu;
  final void Function() redirectToCartDetail;
  
  int numberItems = 0;
  String titulo = "TituloTitulo";
  String descricao = "Descrição de prato teste. Foto doida para testar redimensionamento de imagens.";
  String preco = 'R\$00,00';

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
                  child: DetailItemInfo(widget.titulo, widget.descricao, widget.preco),
                ),                
                const Divider(),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Observações",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
                const Card(
                  elevation: 1,
                  shape: BeveledRectangleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 4, //or null 
                      decoration: InputDecoration.collapsed(hintText: "Peça para caprichar ou retirar algum ingrediente"),
                    ),
                  )
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}