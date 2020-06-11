import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';


class Homepage extends StatefulWidget{
  @override
  Homestate createState() => Homestate();
}


class Homestate extends State<Homepage> {
  int currentWorld=0;
  int totalWorlds=10;
   _horizontalSwipe(SwipeDirection direction){
     if(direction==SwipeDirection.left&&currentWorld!=0){
       currentWorld--;

     }
     else if(direction==SwipeDirection.right&&currentWorld+1<totalWorlds){
       setState(() {
         currentWorld++;
       });
     }

  }
  @override
  Widget build(BuildContext context) {
    return SimpleGestureDetector(
      onHorizontalSwipe: _horizontalSwipe,
    );
  }
}