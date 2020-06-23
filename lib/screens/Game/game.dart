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
  Game(this.grid,this.data,this.currentWorld,this.currentLevel);

  @override
  GameState createState() => GameState(grid);
}

class GameState extends State<Game> {
  int _currentColorState = 0;
  int _onIndex = 0;
  Color _currentColor = Colors.grey;
  Grid grid;

  GameState(this.grid);

  _vertSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.down &&
        grid.swipeCheck(direction, _onIndex, _currentColorState)) {
      setState(() {
        grid.boxes[_onIndex].color = _currentColor;
        _onIndex += grid.columns;
        grid.boxes[_onIndex].visited = true;
      });
    } else if (direction == SwipeDirection.up &&
        grid.swipeCheck(direction, _onIndex, _currentColorState)) //swipe up
      setState(() {
        grid.boxes[_onIndex].color = _currentColor;
        _onIndex -= grid.columns;
        grid.boxes[_onIndex].visited = true;
      });
  }

  _horizontalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.right &&
        grid.swipeCheck(direction, _onIndex, _currentColorState)) {
      //right swipe
      setState(() {
        grid.boxes[_onIndex].color = _currentColor;
        _onIndex += 1;
        grid.boxes[_onIndex].visited = true;
      });
    } else if (direction == SwipeDirection.left &&
        grid.swipeCheck(direction, _onIndex, _currentColorState)) {
      //left swipe
      setState(() {
        grid.boxes[_onIndex].color = _currentColor;
        _onIndex -= 1;
        grid.boxes[_onIndex].visited = true;
      });
    }
  }


  void updateInfo(){
    widget.data.stars++;
    String s = widget.data.levelStr[widget.currentWorld-1];
    String replaced = s.substring(0,widget.currentLevel-1)+'3'+s.substring(widget.currentLevel);
    if(s.substring(widget.currentLevel,widget.currentLevel+1)=='4'){//unlocks next level if the current level is locked
      replaced=replaced.substring(0,widget.currentLevel)+'0'+replaced.substring(widget.currentLevel+1);
    }
    widget.data.coins++;
    widget.data.levelStr[widget.currentWorld-1]=replaced;
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