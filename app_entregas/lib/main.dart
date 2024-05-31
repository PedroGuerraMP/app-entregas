import 'package:app_entregas/scaffold_menu/scaffold_menu.dart';
import 'package:app_entregas/item_detail/item_detail.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainApp> {
  Widget activeScreen = const Scaffold();

@override
  void initState() {
    super.initState();
    activeScreen = ScaffoldMenu(itemDetailSwitchState);

  }

  void itemDetailSwitchState() {
    setState(() {
      activeScreen = ItemDetail(scaffoldMenuOnClick);
    });
  }

  void scaffoldMenuOnClick(){
    setState(() {
      activeScreen = ScaffoldMenu(itemDetailSwitchState);
    });
  }

   @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: activeScreen, 
      );
    }
}
