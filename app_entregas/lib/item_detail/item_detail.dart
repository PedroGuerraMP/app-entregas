import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail(this.scaffoldMenuOnClick, {super.key});

  final void Function() scaffoldMenuOnClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          height: 250,
                          child: 
                          Stack(
                            children: [
                              SizedBox(
                                height: 250,
                                width: MediaQuery.of(context).size.width, 
                                child: Image.asset( 'assets/img/prato-teste.jpg', )
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width, 
                                height: 250,
                                child: ColoredBox(color: Colors.black.withOpacity(0.5))
                              ),
                            IconButton(
                                icon:const Icon(Icons.arrow_back),
                                style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                                onPressed: (){ scaffoldMenuOnClick(); }, 
                              )
                            ],
                          )
                        ,)
                      ],
                    ),
                    const Divider(
                      height: 0,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Titulo"),
                    ),
                    const SizedBox(height: 20,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Descrição de prato teste. Foto doida para testar redimensionamento de imagens."),
                    ),
                    const SizedBox(height: 20,),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 4, //or null 
                          decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                        ),
                      )
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          )
                        ),
                        const Flexible(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                              border: OutlineInputBorder(),
                            ),
                          )
                        ),
                        Flexible(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          )
                        ),
                        Expanded(
                          child: TextButton(
                            style: const ButtonStyle(
                              alignment:  Alignment.topLeft,
                              backgroundColor:  MaterialStatePropertyAll(Colors.purple),
                            ),
                            onPressed: () {},
                            child: const Text(
                              style: TextStyle(color: Colors.white),
                              "Adicionar", 
                            ),
                          )
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
