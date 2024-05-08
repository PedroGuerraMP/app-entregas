import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  
  const CategoryHeader(this.categorias, {super.key});

  final List<String> categorias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorias.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple, 
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                        ),
                        child: Row(
                          children: [
                            Text(categorias[index]),
                            const Icon(Icons.arrow_downward_rounded)
                          ],
                        ),
                        onPressed: () {},
                      );
            },
          );
  }

}