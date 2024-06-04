import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail(this.scaffoldMenuOnClick, {super.key});

  final void Function() scaffoldMenuOnClick;
  
  @override
  State<StatefulWidget> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail>{

  final TextEditingController _controller = TextEditingController(text: "1");

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void increment(bool positive){
    int newValue = int.parse(_controller.value.text);
    
    if(_controller.value.text == ""){
      _controller.value = const TextEditingValue(text: "1");
    }

    positive? newValue++ : newValue--;

    _controller.value = TextEditingValue(text: newValue.toString());
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
                                onPressed: (){ widget.scaffoldMenuOnClick(); }, 
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
                      child: Text("Titulo",
                        style: TextStyle(fontSize: 30), 
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Descrição de prato teste. Foto doida para testar redimensionamento de imagens.",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    const Divider(),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Observações",
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 4, //or null 
                          decoration: InputDecoration.collapsed(hintText: "Peça para caprichar ou retirar algum ingrediente"),
                        ),
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 8,
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () { increment(false); },
                          )
                        ),
                        Flexible(
                          flex: 20,
                          child: TextField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric( horizontal: 10)
                            ),
                            style: const TextStyle(
                              fontSize: 20
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 8,
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () { increment(true); },
                          )
                        ),
                        Flexible(
                          flex: 40,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              alignment:  Alignment.center,
                              backgroundColor:  Colors.purple,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0), 
                              ),
                            ),
                            child: const Text(
                              style: TextStyle(fontSize: 20, color: Colors.white),
                              "Adicionar"
                              ),
                            onPressed: () {},
                          )
                        ),
                        Flexible(
                          flex: 12,
                          child: IconButton(
                            style:  ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(Colors.purple),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),))
                            ),
                            icon: const Icon(Icons.shopping_bag_rounded, color: Colors.white,),
                            onPressed: () => {},
                          )
                        )
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