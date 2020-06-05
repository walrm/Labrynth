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
  List<bool> visited = new List<bool>(_gridSize);

  // var _numRows = _gridSize/_columns;

  void _vertSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.down){ //swipe down
      if(_onIndex+_columns <= _gridSize-1) 
        setState((){
          _onIndex+=_columns;
          print(visited);
        });
    }else if(_onIndex-_columns >=0) //swipe up
      setState((){
        _onIndex-=_columns;
      });
  }

  void _horizontalSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.right){
      if(_onIndex%_columns-1 != 0) //right swipe
        setState((){
          _onIndex+=1;
        });
    }else if(_onIndex%_columns != 0){ //left swipe
      setState((){
        _onIndex-=1;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return SimpleGestureDetector(
      onVerticalSwipe: _vertSwipe,
      onHorizontalSwipe: _horizontalSwipe,
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: _columns,
        children: List.generate(_gridSize, (index) {
          if(index == _onIndex){
            return Container(color: Colors.amber, child: Center(child: Icon(Icons.sentiment_neutral)));
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