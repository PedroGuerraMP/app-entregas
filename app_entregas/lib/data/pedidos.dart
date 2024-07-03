import 'package:app_entregas/data/items.dart';
import 'package:app_entregas/models/adicional.dart';
import 'package:app_entregas/models/adicional_item.dart';
import 'package:app_entregas/models/item.dart';
import 'package:app_entregas/models/pedido.dart';
import 'package:app_entregas/models/pedido_item.dart';

final Pedido pedidoExemplo = Pedido(01, "Incompleto", 0, [
  PedidoItem(
    Item("Arroz com Feijao e carne", "Arroz com Feijão e Carne. Feijão sempre é o carioca.", 10.00, "Janta",
      [
        Adicional(true, "Carne", 1, 0, [
          const AdicionalItem("Frango", 0.00),
          const AdicionalItem("Porco", 0.00),
          const AdicionalItem("Boi", 1.00),
        ]),
        Adicional(true, "Arroz", 1, 1, [
          const AdicionalItem("Branco", 0.00),
          const AdicionalItem("Parborizado", 1.00),
          const AdicionalItem("Integral", 2.00),
        ]),
        Adicional(false, "Salada", 0, 4, [
          const AdicionalItem("Alface", 0.00),
          const AdicionalItem("Tomate", 0.00),
          const AdicionalItem("Cenoura", 1.00),
          const AdicionalItem("Beterraba", 1.00),
          const AdicionalItem("Jiló", 1.00),
        ])
      ]
    ), 1, [
      AdicionalPedido(
        Adicional(true, "Carne", 1, 0, [
          const AdicionalItem("Frango", 0.00),
          const AdicionalItem("Porco", 0.00),
          const AdicionalItem("Boi", 1.00),
        ]),
        [ ("Frango", 1) ]
      ),
      AdicionalPedido(
        Adicional(true, "Arroz", 1, 1, [
          const AdicionalItem("Branco", 0.00),
          const AdicionalItem("Parborizado", 1.00),
          const AdicionalItem("Integral", 2.00),
        ]),
        [("Branco", 1)]
      ),
      AdicionalPedido(
        Adicional(false, "Salada", 0, 4, [
          const AdicionalItem("Alface", 0.00),
          const AdicionalItem("Tomate", 0.00),
          const AdicionalItem("Cenoura", 1.00),
          const AdicionalItem("Beterraba", 1.00),
          const AdicionalItem("Jiló", 1.00),
        ]),
        [("Alface", 1), ("Tomate", 1), ("Cenoura", 2)]
      )
    ]
  ),
  PedidoItem(
    Item("Arroz", "Arroz", 10.00, "Janta",
      [
        Adicional(true, "Carne", 1, 0, [
          const AdicionalItem("Frango", 0.00),
          const AdicionalItem("Porco", 0.00),
          const AdicionalItem("Boi", 1.00),
        ]),
        Adicional(true, "Arroz", 1, 1, [
          const AdicionalItem("Branco", 0.00),
          const AdicionalItem("Parborizado", 1.00),
          const AdicionalItem("Integral", 2.00),
        ]),
        Adicional(false, "Salada", 0, 4, [
          const AdicionalItem("Alface", 0.00),
          const AdicionalItem("Tomate", 0.00),
          const AdicionalItem("Cenoura", 1.00),
          const AdicionalItem("Beterraba", 1.00),
          const AdicionalItem("Jiló", 1.00),
        ])
      ]
    ), 1, [
      AdicionalPedido(
        Adicional(true, "Carne", 1, 0, [
          const AdicionalItem("Frango", 0.00),
          const AdicionalItem("Porco", 0.00),
          const AdicionalItem("Boi", 1.00),
        ]),
        [ ("Frango", 1) ]
      ),
      AdicionalPedido(
        Adicional(true, "Arroz", 1, 1, [
          const AdicionalItem("Branco", 0.00),
          const AdicionalItem("Parborizado", 1.00),
          const AdicionalItem("Integral", 2.00),
        ]),
        [("Branco", 1)]
      ),
      AdicionalPedido(
        Adicional(false, "Salada", 0, 4, [
          const AdicionalItem("Alface", 0.00),
          const AdicionalItem("Tomate", 0.00),
          const AdicionalItem("Cenoura", 1.00),
          const AdicionalItem("Beterraba", 1.00),
          const AdicionalItem("Jiló", 1.00),
        ]),
        [("Alface", 1), ("Tomate", 1), ("Cenoura", 2)]
      )
    ]
  )
]);