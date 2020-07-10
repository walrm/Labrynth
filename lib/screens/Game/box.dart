import 'package:flutter/material.dart';

enum Type{
    normal,
    key,
    lock,
    start,
    end,
    wall,
    trap,
    star
}

class Box extends StatelessWidget{
  int index;
  Color color;
  bool visited;
  bool hasStar;
  String colorState;
  Type type;

  Box(this.index, this.color, this.visited, this.type, this.colorState){
    hasStar=false;
  }

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
    }else if(isKey()){
      text = Text(this.colorState);
    }else if(isLock()){
      text = Text(this.colorState);
    }else if(isTrap()){
      text = Text('^');
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

  bool isTrap(){
    return this.type == Type.trap;
  }

  void setColor(String s){
    switch(s){
      case 'a':{ this.color=Colors.green;}
      break;
      
      case 'b':{this.color=Colors.blue;}
      break;
      
      case 'c':{this.color=Colors.orange;}
      break;
    
      case 'd':{this.color=Colors.red;}
      break;

      case 'e':{this.color=Colors.purple;}
      break;

      case 'f':{this.color=Colors.yellow;}
      break;

      case 'g':{this.color=Colors.brown;}
      break;

      case 'h':{this.color=Colors.pink;}
      break;

    }
  }
}