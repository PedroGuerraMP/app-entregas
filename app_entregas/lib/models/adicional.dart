import 'package:app_entregas/models/adicional_item.dart';

class Adicional {

  final bool eObrigatorio;
  final String nome;
  final int minimo;
  final int maximo;
  final List<AdicionalItem> items;
  late final List<AdicionalItem> itemsSelecionados;

  Adicional(this.eObrigatorio, this.nome, this.minimo, this.maximo, this.items);
}