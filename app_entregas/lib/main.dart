import 'package:app_entregas/screens/cart_detail/cart_detail.dart';
import 'package:app_entregas/screens/auth/login.dart';
import 'package:app_entregas/screens/scaffold_menu/scaffold_menu.dart';
import 'package:app_entregas/screens/item_detail/item_detail.dart';

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
    setStateLogin();
  }

  void setStateLogin(){
    setState(() {
      activeScreen = Login(setStateScaffoldMenu);
    });
  }

  void setStateScaffoldMenu(){
    setState(() {
      activeScreen = ScaffoldMenu(setStateItemDetail);
    });
  }

  void setStateItemDetail() {
    setState(() {
      activeScreen = ItemDetail(setStateScaffoldMenu, setStateCartDetail);
    });
  }

  void setStateCartDetail(){
    setState(() {
      activeScreen = CartDetail();
    });
  }

   @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: activeScreen, 
      );
    }
}
