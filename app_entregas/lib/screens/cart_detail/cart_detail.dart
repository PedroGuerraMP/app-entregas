
import 'package:flutter/material.dart';

class CartDetail extends StatefulWidget {
  const CartDetail(this.redirectBack, { super.key });
  
  final void Function() redirectBack;
  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Stack(
          clipBehavior: Clip.none,
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Sacola',
              ),
            ),
            Positioned(
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () { widget.redirectBack(); },
              ),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          Divider(),
          Text('Cart Detail'),
        ],
      ),
    );
  }
}