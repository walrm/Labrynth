import 'package:flutter/material.dart';
enum Type{
    normal,
    key,
    lock,
    start,
    end,
    wall
}
class Box extends StatelessWidget{
  int index;
  Color color;
  bool visited;
  int colorState;
  Type type;

  Box(this.index, this.color, this.visited, this.type, this.colorState);

  void reachedKey(Color c){
    if(visited){
      this.color=c;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(isWall()){
      this.color = Colors.black;
    }
    return Container(
      color: color,
      child: Center(child: Text('Item $index',style: Theme.of(context).textTheme.headline5)),
    );
  }
  bool isWall(){
    if(this.type==Type.wall){
      return true;
    }
    return false;
  }

  void setColor(String s){
    switch(s){
      case 'r':{ this.color=Colors.red;}
      break;
      
      case 'b':{this.color=Colors.blue;}
      break;
      
      case 'g':{this.color=Colors.green;}
      break;
    
      case 'o':{this.color=Colors.orange;}
      break;

      case 'y':{this.color=Colors.yellow;}
      break;

      case 'p':{this.color=Colors.pink;}
      break;

    }
  }
}