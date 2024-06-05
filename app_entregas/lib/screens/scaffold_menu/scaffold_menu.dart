import 'package:flutter/material.dart';

import 'package:app_entregas/main_menu.dart';
import 'package:app_entregas/data/items.dart';
import 'package:app_entregas/screens/scaffold_menu/category_header.dart';
import 'package:app_entregas/screens/scaffold_menu/vertical_slider.dart';
import 'package:app_entregas/screens/scaffold_menu/horizontal_slider.dart';

class ScaffoldMenu extends StatelessWidget {
  const ScaffoldMenu(this.itemDetailOnClick, {super.key});

  final void Function() itemDetailOnClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('UNIDADE I ', style: TextStyle(fontSize: 14)),
                    Text(' - 35 min ', style: TextStyle(fontSize: 12)),
                    Icon(Icons.arrow_downward_rounded, size: 20,)
                  ],
                ),
                onPressed: () {},
              )),
          body:  
          Column(
            children: [
              SizedBox( 
                height: 180, 
                child: Column(
                  children:  [
                    const Divider(), 
                    const SizedBox(
                      height: 20,
                      child: Text('DESTAQUES', textAlign: TextAlign.center),
                    ),
                    Expanded(child: HorizontalSlider(itemDetailOnClick)),
                  ],
                )
              ),
              const Divider(),
              SizedBox(
                height: 40,
                child: CategoryHeader(listaItems.map((e) => e.categoria).toSet().toList())
              ),
              const SizedBox(
                height: 350,
                child: VerticalSlider(listaItems),
              ),
              const SizedBox(
                height: 50,
                child: MainMenu()
              )
            ],
          )
        );
  }
}
