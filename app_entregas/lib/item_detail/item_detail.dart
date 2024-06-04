import 'package:app_entregas/item_detail/item_detail_info.dart';
import 'package:flutter/material.dart';
import 'package:app_entregas/item_detail/detail_button_row.dart';

class ItemDetail extends StatefulWidget {
  ItemDetail(this.scaffoldMenuOnClick, {super.key});

  final void Function() scaffoldMenuOnClick;
  
  int numberItems = 0;

  @override
  State<StatefulWidget> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DetailButtonRow(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: [
                    DetailItemInfo(widget.scaffoldMenuOnClick),
                    const Divider(),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Observações",
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 4, //or null 
                          decoration: InputDecoration.collapsed(hintText: "Peça para caprichar ou retirar algum ingrediente"),
                        ),
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}