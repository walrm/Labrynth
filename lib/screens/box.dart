import 'package:flutter/material.dart';

class Box extends StatelessWidget{
  int index;
  Color color;
  bool visited;
  bool isWall;
  int colorState;

  Box(this.index, this.color, this.visited, this.isWall, this.colorState);

  void reachedKey(Color c){
    if(visited){
      this.color=c;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(this.isWall){
      this.color = Colors.black;
    }
    return Container(
      color: color,
      child: Center(child: Text('Item $index',style: Theme.of(context).textTheme.headline5)),
    );
  }
}
