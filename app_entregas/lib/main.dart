import 'package:app_entregas/category_header.dart';
import 'package:app_entregas/main_menu.dart';
import 'package:app_entregas/vertical_slider.dart';
import 'package:app_entregas/horizontal_slider.dart';
import 'package:app_entregas/data/items.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: OutlinedButton(
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
                    Expanded(child: HorizontalSlider()),
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
        ), 
    );
  }
}
