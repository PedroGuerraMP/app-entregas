import 'package:flutter/material.dart';

class DetailItemInfo extends StatelessWidget {
  DetailItemInfo(this.titulo, this.descricao, this.preco, {super.key});

  String titulo, descricao, preco = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            style: const TextStyle(fontSize: 20),
            titulo,
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.fade,
              maxLines: 2,
              descricao,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            "R\$$preco",
          ),
        ),
      ],
    );
  }
}
