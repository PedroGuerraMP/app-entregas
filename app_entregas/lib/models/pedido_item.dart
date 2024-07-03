import 'package:app_entregas/models/adicional.dart';
import 'package:app_entregas/models/item.dart';

class PedidoItem {
  Item item;
  int quantidade;
  List<AdicionalPedido> listaAdicionais;

  PedidoItem(this.item, this.quantidade, this.listaAdicionais);
}

class AdicionalPedido {
  Adicional adicional;
  List<(String, int)> quantidadeAdicionalItems;

  AdicionalPedido(this.adicional, this.quantidadeAdicionalItems);
}