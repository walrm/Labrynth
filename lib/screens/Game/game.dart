import 'package:Labrynth_test/screens/Game/levelcomplete.dart';
import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'grid.dart';
import '../../widgets/saveState.dart';

class Game extends StatefulWidget {
  final Grid grid;
  final SaveState data; //all of the backend stored stuff
  final int currentWorld; //integer for the current world-starts from 1
  final int currentLevel; //Level number in the world-starts from 1
  final int numPuzzles;

  List<String> colorStates = new List<String>();
  
  Game(this.grid,this.data,this.currentWorld,this.currentLevel, this.numPuzzles);

  @override
  GameState createState() => GameState(grid);
}

class GameState extends State<Game> {
  int _onIndex = 0;
  Color _currentColor = Colors.grey;
  Grid grid;

  GameState(this.grid);

  _vertSwipe(SwipeDirection direction) {
    if(grid.swipeCheck(direction, _onIndex, widget.colorStates)){
      grid.boxes[_onIndex].color = _currentColor;
      if(direction == SwipeDirection.down)
        _onIndex += grid.columns;
      else if(direction == SwipeDirection.up)
        _onIndex -= grid.columns;
      setState((){
        grid.boxes[_onIndex].visited = true;
        if(grid.boxes[_onIndex].isKey())
          widget.colorStates.add(grid.boxes[_onIndex].colorState);
        else if(grid.boxes[_onIndex].isTrap())
          widget.colorStates = [];
      });
    }
  }

  _horizontalSwipe(SwipeDirection direction) {
    if(grid.swipeCheck(direction, _onIndex, widget.colorStates)){
      grid.boxes[_onIndex].color = _currentColor;
      if(direction == SwipeDirection.right)
        _onIndex += 1;
      else if(direction == SwipeDirection.left)
        _onIndex -= 1;
      setState((){
        grid.boxes[_onIndex].visited = true;
        if(grid.boxes[_onIndex].isKey())
          widget.colorStates.add(grid.boxes[_onIndex].colorState);
        else if(grid.boxes[_onIndex].isTrap())
          widget.colorStates = [];
      });
    }

  }

  void updateInfo(){
    widget.data.stars++;
    print(widget.currentLevel);
    if(widget.currentLevel+1 == widget.numPuzzles){ //unlock the next world if completed last level in current world
      widget.data.levelStr.add('0');
    }else if(widget.currentLevel+1==widget.data.levelStr[widget.currentWorld].length){
      widget.data.levelStr[widget.currentWorld] += "0";
    }
    widget.data.coins++;
    widget.data.write();
  }


  @override
  Widget build(BuildContext context) {
    if (grid.checkWin(_onIndex)) {
      updateInfo();
      return LevelComplete();
    } 
    return SimpleGestureDetector(
      onVerticalSwipe: _vertSwipe,
      onHorizontalSwipe: _horizontalSwipe,
      child: Column(
        children: <Widget>[
          GridView.count(
            childAspectRatio: grid.size/grid.columns/grid.columns,
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            crossAxisCount: grid.columns,
            children: List.generate(grid.size, (index) {
              if (index == _onIndex) {
                return Container(
                  color: _currentColor,
                  child: Center(child: Icon(Icons.sentiment_neutral)));
              }
              return grid.boxes[index];
            }),
          ),
          Center(
            child: IconButton(
              iconSize: 120,
              icon: Icon(Icons.refresh),
              onPressed: (){
                setState((){
                  grid.reset();
                  _onIndex = grid.startIndex;
                });
              },
            )
          )
        ],
      )
    );
  }
}