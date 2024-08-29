import 'package:app_entregas/models/pedido_item.dart';

class Pedido {

  final int numero;
  final String status;
  final double total;
  final List<PedidoItem> items;

  Pedido(this.numero, this.status, this.total, this.items);
  
}
