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
  String colorState;
  Type type;

  Box(this.index, this.color, this.visited, this.type, this.colorState);

  void reachedKey(Color c){
    if(visited){
      this.color=c;
    }
  }

  @override
  Widget build(BuildContext context) {
    Text text;
    if(this.type==Type.end){
      text = Text('?');
    }else if(this.type == Type.key){
      text = Text(this.colorState);
    }else if(this.type == Type.lock){
      text = Text(this.colorState);
    }

    if(isWall()){
      this.color = Colors.black;
    }
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1.0, color: Colors.black)
      ),
      child: Center(child: text),
    );
  }

  bool isWall(){
    return this.type == Type.wall;
  }

  bool isKey(){
    return this.type == Type.key;
  }

  bool isLock(){
    return this.type == Type.lock;
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