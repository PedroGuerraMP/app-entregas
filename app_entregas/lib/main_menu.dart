import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: const Icon(Icons.account_circle, size: 35,),
                onPressed: () {}, 
              ),
              TextButton(
                child: const Icon(Icons.home, size: 35,),
                onPressed: () {}, 
              ),
              TextButton(
                child: const Icon(Icons.article, size: 35,),
                onPressed: () {}, 
              ),
            ],
          );
  }

}