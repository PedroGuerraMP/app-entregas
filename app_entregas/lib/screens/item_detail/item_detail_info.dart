import 'package:flutter/material.dart';

class DetailItemInfo extends StatelessWidget {
  const DetailItemInfo(this.scaffoldMenuOnClick, {super.key});

  final void Function() scaffoldMenuOnClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/img/prato-teste.jpg',
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: ColoredBox(color: Colors.black.withOpacity(0.5))),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () { scaffoldMenuOnClick(); },
                  )
                ],
              ),
            )
          ],
        ),
        const Divider(
          height: 0,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Titulo",
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Descrição de prato teste. Foto doida para testar redimensionamento de imagens.",
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
