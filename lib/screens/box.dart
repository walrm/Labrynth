import 'package:flutter/material.dart';

class Box{
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
}
