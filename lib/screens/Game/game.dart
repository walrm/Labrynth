import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'grid.dart';
import 'box.dart';
import '../Home/Homepage.dart';
import '../Map/worldmap.dart';

class Game extends StatefulWidget {
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

  Color _setColor(
    int index,
  ) {
    if (grid.boxes[index].visited) return _currentColor;
    if (grid.boxes[index].isWall()) return Colors.black;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    if (grid.checkWin(_onIndex)) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: (2 * width) / 3,
          height: height / 3,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Level Complete!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,//Home button
                  child: ClipOval(
                    child: Material(
                      color:Colors.grey,
                      child:InkWell(
                        splashColor:Colors.lightBlue,
                        child: SizedBox(
                          width: height/12, 
                          height: height/12, 
                          child: Icon(
                            Icons.home
                          ),
                        ),
                        onTap:(){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              //Change this to the homepage later instead of world page
                              builder: (context)=>new Homepage())
                            );
                        }
                        ),
                      ),
                    ), 
                  ),
                Align(
                  alignment: Alignment.bottomCenter,//Map Button       
                  child: ClipOval(
                    child: Material(
                      color:Colors.grey,
                      child:InkWell(
                        splashColor:Colors.lightBlue,
                        child: SizedBox(
                          width: height/12, 
                          height: height/12, 
                          child: Icon(Icons.apps),
                        ),
                        onTap:(){
                          //Navigator.push(
                          //   context,
                          //   new MaterialPageRoute(
                          //     //builder: (context)=>new Map())
                          // );
                        },
                      ),
                    ), 
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight, //Next level button
                  child: ClipOval(
                    child: Material(
                      color:Colors.grey,
                      child:InkWell(
                        splashColor:Colors.lightBlue,
                        child: SizedBox(
                          width: height/12, 
                          height: height/12, 
                          child: Icon(
                            Icons.arrow_forward
                          )
                        ),
                        onTap:(){},
                      ),
                    ), 
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SimpleGestureDetector(
          onVerticalSwipe: _vertSwipe,
          onHorizontalSwipe: _horizontalSwipe,
          child: GridView.count(
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
          ));
    }
  }
}