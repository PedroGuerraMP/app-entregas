
import 'package:app_entregas/data/pedidos.dart';
import 'package:app_entregas/models/item.dart';
import 'package:app_entregas/models/pedido.dart';
import 'package:app_entregas/models/pedido_item.dart';
import 'package:app_entregas/screens/cart_detail/cart_vertical_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_entregas/data/items.dart';


class CartDetail extends StatefulWidget {
  CartDetail(this.redirectBack, { super.key });
  
  late List<(String, TextEditingController)> listaPedidoItemsControllers;
  
  final void Function() redirectBack;
  final Pedido pedido = pedidoExemplo;

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> with SingleTickerProviderStateMixin {
  
    @override 
  void initState(){
    widget.listaPedidoItemsControllers = [];
    for (PedidoItem element in widget.pedido.items) {
      widget.listaPedidoItemsControllers.add((element.item.nome, TextEditingController(text: "${element.quantidade}")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Sacola',
                ),
              ),
              Positioned(
                height: 40,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () { widget.redirectBack(); },
                ),
              ),
            ],
          ),
          const Divider(),
          ],
        ),
      ),
      body: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.restore_from_trash_sharp), onPressed: () {}, ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ), 
                child: const SizedBox(
                  width:150,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Pedir"
                    ),
                ),
                onPressed: (){}, 
              ), 
              ],
          ),
          SizedBox(
            height: 500,
            child: CartVerticalSlider(widget.pedido, widget.redirectBack, widget.listaPedidoItemsControllers),
          ),
        ],
      ),
    );
  }
}