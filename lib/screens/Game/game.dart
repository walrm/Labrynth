import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'grid.dart';

class Game extends StatefulWidget{
  final Grid grid;

  Game(this.grid);

  @override
  GameState createState() => GameState(grid); 
}

class GameState extends State<Game> {
  int _currentColorState = 0;
  var _onIndex = 0;
  Color _currentColor = Colors.grey;
  Grid grid;

  GameState(this.grid);

  _vertSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.down && grid.swipeCheck(direction, _onIndex, _currentColorState)){
      setState((){
        grid.boxes[_onIndex].color = _currentColor;
        _onIndex+=grid.columns;
        grid.boxes[_onIndex].visited=true;
      });
    }else if(direction == SwipeDirection.up && grid.swipeCheck(direction, _onIndex, _currentColorState)) //swipe up
      setState((){
        grid.boxes[_onIndex].color = _currentColor;
        _onIndex-=grid.columns;
        grid.boxes[_onIndex].visited=true;
      });
  }

  _horizontalSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.right && grid.swipeCheck(direction, _onIndex, _currentColorState)){ //right swipe
      setState((){
        grid.boxes[_onIndex].color = _currentColor;
        _onIndex+=1;
        grid.boxes[_onIndex].visited=true;
      });
    }else if(direction == SwipeDirection.left && grid.swipeCheck(direction, _onIndex, _currentColorState)){ //left swipe
      setState((){
        grid.boxes[_onIndex].color = _currentColor;
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
    return Scaffold(
      appBar: AppBar(title: Text('Game')),
      body: SimpleGestureDetector(
      onVerticalSwipe: _vertSwipe,
      onHorizontalSwipe: _horizontalSwipe,
      child: GridView.count(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: grid.columns,
        children: List.generate(grid.size, (index) {
          if(index == _onIndex){
            return Container(color: _currentColor, child: Center(child: Icon(Icons.sentiment_neutral)));
          }
          return grid.boxes[index];
        }
      ),
      )
    )
  );
}
}