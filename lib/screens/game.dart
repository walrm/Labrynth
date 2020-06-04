import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Game extends StatefulWidget{
  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  var _onIndex = 0;
  static int _gridSize = 4;
  static int _columns = 2;
  var _numRows = _gridSize/_columns;

  void _vertSwipe(SwipeDirection direction) {
    print("here");
  }

  void _horizontalSwipe(SwipeDirection direction) {
    print("here");
  }


  @override
  Widget build(BuildContext context){
    return SimpleGestureDetector(
      onVerticalSwipe: _vertSwipe,
      onHorizontalSwipe: _horizontalSwipe,
      // onHorizontalDragEnd: (details) {
      //     if (details.primaryVelocity.compareTo(0) != -1) {
      //       if(_onIndex%_columns-1 != 0) //right swipe
      //       setState((){
      //         _onIndex+=1;
      //         print(_onIndex);
      //       });
      //     }else if(_onIndex%_columns != 0){ //left swipe
      //       setState((){
      //         _onIndex-=1;
      //         print(_onIndex);
      //       });
      //     }
      // },
      child: GridView.count(
        crossAxisCount: _columns,
        children: List.generate(_gridSize, (index) {
          if(index == _onIndex){
            return Center(child: Icon(Icons.sentiment_neutral));
          }
          return InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Center(child: Text('Item $index',style: Theme.of(context).textTheme.headline5)),
          );
        }),
      )
    );
  }
}