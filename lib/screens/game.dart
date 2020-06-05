import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import './box.dart';

class Game extends StatefulWidget{
  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  int _currentColorState = 0;
  var _onIndex = 0;
  static int _gridSize = 9;
  static int _columns = 3;
  static Color _currentColor = Colors.amber;
  List<Box> boxes= new List<Box>(_gridSize);
  // List<Box> boxes = List.filled(_gridSize, new Box(0,Colors.white,false));

  _vertSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.down){ //swipe down
      if(_onIndex+_columns <= _gridSize-1 && !boxes[_onIndex+_columns].isWall && 
      (boxes[_onIndex+_columns].colorState==0 || boxes[_onIndex+_columns].colorState==_currentColorState))
        setState((){
          _onIndex+=_columns;
          boxes[_onIndex].visited=true;
        });
    }else if(_onIndex-_columns >=0 && !boxes[_onIndex-_columns].isWall && 
    (boxes[_onIndex-_columns].colorState==0 || boxes[_onIndex-_columns].colorState==_currentColorState)) //swipe up
      setState((){
        _onIndex-=_columns;
        boxes[_onIndex].visited=true;
      });
  }

  _horizontalSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.right){
      if((_onIndex+1)%_columns != 0  && !boxes[_onIndex+1].isWall && 
      (boxes[_onIndex+1].colorState==0 || boxes[_onIndex+1].colorState==_currentColorState)) //right swipe
        setState((){
          _onIndex+=1;
        boxes[_onIndex].visited=true;
        });
    }else if(_onIndex%_columns != 0 && !boxes[_onIndex-1].isWall &&
    (boxes[_onIndex-1].colorState==0 || boxes[_onIndex-1].colorState==_currentColorState)){ //left swipe
      setState((){
        _onIndex-=1;
        boxes[_onIndex].visited=true;
      });
    }
  }

  Color _setColor(int index,){
    if(boxes[index].visited)
      return _currentColor;
    if(boxes[index].isWall)
      return Colors.black;
    return Colors.white;
  }

  int isInit=1;
  void init(){
    for(int i=0;i<_gridSize;i++){
      boxes[i]=new Box(i,Colors.white,false,false,0);
    }
    boxes[0].visited=true;
    boxes[1].isWall = true;
    boxes[8].colorState = 1;
  }

  @override
  Widget build(BuildContext context){
    if(isInit==1){
      init();
      isInit=0;
    }
    return SimpleGestureDetector(
      onVerticalSwipe: _vertSwipe,
      onHorizontalSwipe: _horizontalSwipe,
      child: GridView.count(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: _columns,
        children: List.generate(_gridSize, (index) {
          if(_onIndex==6){
            _currentColor=Colors.green;
            _currentColorState = 1;
          }
          if(index == _onIndex){
            return Container(color: _currentColor, child: Center(child: Icon(Icons.sentiment_neutral)));
          }
          if(index == 6){
            return Container(
              color: Colors.green,
              child: Center(child: Icon(Icons.vpn_key)));
          }
          if(index == 8){
            return Container(
              color: Colors.green,
              child: Center(child: Icon(Icons.lock)));
          }
          return Container(
            color: _setColor(index),
            child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Center(child: Text('Item $index',style: Theme.of(context).textTheme.headline5)),
            )
          );
        }),
      ),
    );
  }
}