import 'package:app_entregas/models/adicional.dart';

class Item {

  final String nome;
  final String descricao;
  final double preco;
  final String categoria;
  final List<Adicional> adicionais;

  const Item(this.nome, this.descricao, this.preco, this.categoria, this.adicionais);  
}