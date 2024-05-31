import 'package:flutter/material.dart';

class CategoryHeader extends StatefulWidget {
  
  const CategoryHeader(this.categorias, this.onCategorySelected, {super.key});

  final List<String> categorias;

  final Function(String? category) onCategorySelected;
  
  @override
  State<StatefulWidget> createState() =>_CategoryHeaderUnselectState();

}

class _CategoryHeaderUnselectState extends State<CategoryHeader> {
  
  late List<String> categoriasComSelecao;
  String? selecao;

  @override
  void initState() {
    super.initState();
    categoriasComSelecao = widget.categorias;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categorias.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: selecao == null || selecao != categoriasComSelecao[index] ? Colors.white : Colors.purple[100],
                          foregroundColor: Colors.purple, 
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                        ),
                        child: Row(
                          children: [
                            Text(categoriasComSelecao[index]),
                            const Icon(Icons.arrow_downward_rounded)
                          ],
                        ),
                        onPressed: () {categoryOnClick(index);},
                      );
            },
          );
  }

  void categoryOnClick(int index){
    if(selecao == categoriasComSelecao[index]){
      selecao = null;

      categoriasComSelecao = List.from(widget.categorias);
    }
    else {
      selecao = categoriasComSelecao[index];
      
      categoriasComSelecao = List.from(widget.categorias);

      categoriasComSelecao.remove(selecao);
      
      categoriasComSelecao.insert(0, selecao ?? widget.categorias[index]);
    }
    
    widget.onCategorySelected(selecao);

    setState(() {});
  }
}