import 'package:flutter/material.dart';

class ItemImageStack extends StatelessWidget {

  ItemImageStack(this.scaffoldMenuOnClick, this.imagePath, {super.key});
  
  String imagePath = "";

  final void Function() scaffoldMenuOnClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(imagePath,)
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: ColoredBox(color: Colors.black.withOpacity(0.3))
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
            onPressed: () { scaffoldMenuOnClick(); },
          )
        ],
      ),
    );
  }
}
