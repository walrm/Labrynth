import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Game extends StatefulWidget{
  @override
  GameState createState() => GameState();
}


class Box{
  int index;
  Color c;
  bool visited;
  bool isWall;
  Box(int index,Color c,bool test){
    this.index=index;
    this.c=c;
  }
  Box.defaultBox(int index){
    this.index=index;
    this.c=Colors.white;
    this.visited=false;
  }
  Box.empty(){
  }
  void reachedKey(Color c){
    if(visited){
      this.c=c;
    }
  }
}

class GameState extends State<Game> {
  var _onIndex = 0;
  static int _gridSize = 4;
  static int _columns = 2;
  static Box b=new Box.defaultBox(0);
  static Color _currentColor=Colors.amber;
  //List<Box> boxes = new List<Box>.filled(_gridSize,b,growable: true);
  List<Box> boxes= new List<Box>(_gridSize);
  // var _numRows = _gridSize/_columns;

  void _vertSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.down){ //swipe down
      if(_onIndex+_columns <= _gridSize-1) 
        setState((){
          _onIndex+=_columns;
          boxes[_onIndex].visited=true;
        });
    }else if(_onIndex-_columns >=0) //swipe up
      setState((){
        _onIndex-=_columns;
        boxes[_onIndex].visited=true;
      });
  }

  void _horizontalSwipe(SwipeDirection direction) {
    if(direction == SwipeDirection.right){
      if((_onIndex+1)%_columns != 0) //right swipe
        setState((){
          _onIndex+=1;
        boxes[_onIndex].visited=true;
        });
    }else if(_onIndex%_columns != 0){ //left swipe
      setState((){
        _onIndex-=1;
        boxes[_onIndex].visited=true;
      });
    }
  }
  Color _setColor(int index,){
    print(index);

    print("GAP");
    print(boxes[index].visited);
    if(boxes[index].visited){
      return _currentColor;
    }
    else{
      return Colors.white;
    }
  }
  int isInit=1;
  void init(){
    for(int i=0;i<_gridSize;i++){
      boxes[i]=new Box.empty();
      boxes[i].index=i;
      boxes[i].c=Colors.white;
      boxes[i].visited=false;

    }
    boxes[0].visited=true;
    //boxes[0].c=Colors.amber;

  }
  @override
  Widget build(BuildContext context){
    if(isInit==1){
      init();
      isInit=0;
    }
    return Align(
      alignment: Alignment.center,
      child:
      SimpleGestureDetector(
      onVerticalSwipe: _vertSwipe,
      onHorizontalSwipe: _horizontalSwipe,
      child: Align(
        alignment: Alignment.center,
        child: GridView.count(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: _columns,
        children: List.generate(_gridSize, (index) {
          if(_onIndex==2){
            _currentColor=Colors.green;
          }
          if(index == _onIndex){
            return Center(
            child: Container(color: _currentColor, child: Center(child: Icon(Icons.sentiment_neutral))),
            );
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
      ),
    ),
    );
  }
}