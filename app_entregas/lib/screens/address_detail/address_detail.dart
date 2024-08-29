import 'package:app_entregas/data/endereco.dart';
import 'package:app_entregas/models/endereco.dart';
import 'package:flutter/material.dart';

class AddressDetail extends StatefulWidget {
  late List<Endereco> listaEnderecos = enderecos;

  AddressDetail({super.key});

  @override
  State<StatefulWidget> createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {
  
  int? _idEndereco = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      itemCount: widget.listaEnderecos.length,
      itemBuilder: (BuildContext aContext, int pIndex) {
        return SizedBox(
          height: 100,
          // width: MediaQuery.of(context).size.width*0.7,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: RadioListTile<int>(
                  title: Text(widget.listaEnderecos[pIndex].logradouro),
                  subtitle: Text(widget.listaEnderecos[pIndex].cep),
                  value: widget.listaEnderecos[pIndex].id,
                  groupValue: _idEndereco,
                  onChanged: (int? value) {
                    setState(() {
                      _idEndereco = value;
                    });
                  },
                ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
            ],
          ),
        );
      }
    );
  }
}