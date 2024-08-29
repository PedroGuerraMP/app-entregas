import 'dart:async';

import 'package:app_entregas/screens/address_detail/address_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ConfirmData extends StatefulWidget {
  const ConfirmData(this.redirectBack, {super.key});

  final void Function() redirectBack;

  @override
  State<StatefulWidget> createState() => _StateConfirmData();
  
}

class _StateConfirmData extends State<ConfirmData> {

  ScrollDirection _scrollDirection = ScrollDirection.forward;
  
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();

  Color? bullet0, bullet1 = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Confirmar Dados',
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
          const Divider(),
          ],
        ),
      ),
      body: Column( 
        children: [
        SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            // width: MediaQuery.of(context).size.width*0.7,
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if(notification.direction == ScrollDirection.idle){
                  return true;
                }
                _scrollDirection = notification.direction;
                
                if(_scrollDirection == ScrollDirection.reverse){
                  itemScrollController.scrollTo(index: 1, duration: Durations.medium1);
                  bullet0 = Colors.grey;
                  bullet1 = Colors.grey[600];
                }
                if(_scrollDirection == ScrollDirection.forward){
                  itemScrollController.scrollTo(index: 0, duration: Durations.medium1);
                  bullet1 = Colors.grey;
                  bullet0 = Colors.grey[600];
                }
                Future.delayed(const Duration(milliseconds: 700), () {
                    setState(() {});
                  }, 
                );
                return true;
              },
              child: ScrollablePositionedList.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                scrollOffsetListener: scrollOffsetListener,
                itemBuilder: (context, index) => 
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: index==0 ? AddressDetail() : AddressDetail(),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(color: bullet0, Icons.circle),
              const SizedBox(width: 20,),
              Icon(color: bullet1, Icons.circle ),
            ]
          )
        ]
      )
    );
  }
  onScroll(UserScrollNotification notification){
    
    setState(() {
      
    });
  }
}