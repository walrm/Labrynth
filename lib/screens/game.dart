import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'grid.dart';

class Game extends StatefulWidget{
  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  int _currentColorState = 0;
  var _onIndex = 0;
  Color _currentColor = Colors.amber;
  Grid grid = new Grid(9, 3, true);

  _vertSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.down && grid.swipeCheck(direction, _onIndex, _currentColorState)){
        setState((){
          _onIndex+=grid.columns;
          grid.boxes[_onIndex].visited=true;
        });
    }else if(direction == SwipeDirection.up && grid.swipeCheck(direction, _onIndex, _currentColorState)) //swipe up
      setState((){
        _onIndex-=grid.columns;
        grid.boxes[_onIndex].visited=true;
      });
  }

  _horizontalSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.right && grid.swipeCheck(direction, _onIndex, _currentColorState)){ //right swipe
        setState((){
          _onIndex+=1;
          grid.boxes[_onIndex].visited=true;
        });
    }else if(direction == SwipeDirection.left && grid.swipeCheck(direction, _onIndex, _currentColorState)){ //left swipe
      setState((){
        _onIndex-=1;
        grid.boxes[_onIndex].visited=true;
      });
    }
  }

  Color _setColor(int index,){
    if(grid.boxes[index].visited)
      return _currentColor;
    if(grid.boxes[index].isWall)
      return Colors.black;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context){
    return SimpleGestureDetector(
      onVerticalSwipe: _vertSwipe,
      onHorizontalSwipe: _horizontalSwipe,
      child: GridView.count(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: grid.columns,
        children: List.generate(grid.size, (index) {
          if(_onIndex==6){
            _currentColor=Colors.green;
            _currentColorState = 1;
          }
          if(index == _onIndex){
            return Container(color: _currentColor, child: Center(child: Icon(Icons.sentiment_neutral)));
          }
          if(index == 6){
            if(grid.boxes[6].visited){
              return Container(
              color: Colors.green,
              child: Center(child: Icon(Icons.vpn_key)));
            }
            return Container(
              color: Colors.white,
              child: Center(child: Icon(Icons.vpn_key, color: Colors.green)));
          }
          if(index == 8){
            if(grid.boxes[8].visited){
              return Container(
              color: Colors.green,
              child: Center(child: Icon(Icons.lock)));
            }
            return Container(
              color: Colors.white,
              child: Center(child: Icon(Icons.lock, color: Colors.green)));
          }
          return Container(
            color: _setColor(index),
            child: Center(child: Text('Item $index',style: Theme.of(context).textTheme.headline5)),
          );
        }),
      ),
    );
  }
}