import 'package:app_entregas/models/adicional.dart';
import 'package:app_entregas/models/adicional_item.dart';
import 'package:app_entregas/models/item.dart';

 final List<Item> listaItems = [
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
  ]),
  const Item("Item 10", "descricao 10", 10.00, "Almoço", []),
  const Item("Item 12", "descricao 12", 10.00, "Almoço", []),
  const Item("Item 13", "descricao 13", 10.00, "Almoço", []),
  const Item("Item 20", "descricao 20", 20.00, "Acompanhamentos", []),
  const Item("Item 22", "descricao 22", 20.00, "Acompanhamentos", []),
  const Item("Item 23", "descricao 23", 20.00, "Acompanhamentos", []),
  const Item("Item 30", "descricao 30", 30.00, "Aperitivos", []),
  const Item("Item 32", "descricao 32", 30.00, "Aperitivos", []),
  const Item("Item 33", "descricao 33", 30.00, "Aperitivos", []),
  const Item("Item 40", "descricao 40", 40.00, "Combos", []),
  const Item("Item 42", "descricao 42", 40.00, "Combos", []),
  const Item("Item 43", "descricao 43", 40.00, "Combos", []),
];