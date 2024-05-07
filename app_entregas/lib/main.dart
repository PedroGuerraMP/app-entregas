import 'package:flutter/material.dart';
import 'package:app_entregas/horizontal_slider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final String tituloPrato0 = 'PRATO-0';
  final String descPrato0 =
      'LOREM IPSUM DOLOR SIT AMET LOREM IPSUM DOLOR SIT AMET LOREM IPSUM DOLOR SIT AMET LOREM IPSUM DOLOR SIT AMET';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: TextButton(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('UNIDADE I'),
                    Icon(Icons.arrow_downward_rounded)
                  ],
                ),
                onPressed: () {},
              )),
          body:  SizedBox(
            height: 200,
            child: Column(
            children:  [
              const Divider(), 
              const SizedBox(
                height: 20,
                child: Text('DESTAQUES', textAlign: TextAlign.center),
              ),
              Expanded(
                child: HorizontalSlider() 
              ),
            ],
          )
          )
        ), 
    );
  }
}
