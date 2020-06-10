import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'box.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Grid{
  int size;
  int numLocks;
  int columns;
  bool isInit;
  List<Box> boxes;

  Grid(this.size, this.columns, this.isInit){
    boxes = new List<Box>(this.size);
    for(int i=0; i<this.size; i++){
      boxes[i]=new Box(i,Colors.white,false,false,0);
    }
    init('data.txt');    
    //Temporary
    boxes[0].visited=true;
    boxes[1].isWall = true;
    boxes[8].colorState = 1;
  }

  Future<void> init(String filename) async{
    await readFile('data.txt');
  }

  Future<String> loadAsset(String filename) async {
    return await rootBundle.loadString('assets/'+filename);
  }

  Future<void>  readFile(String filename) async{
    String s= await loadAsset(filename);
    int place=0;
    String temp=s.substring(place,++place);
    String sizes='';
    while(temp!=' '){
      print('temp in loop:');
      print(temp);
      sizes=sizes+temp;
      print(place);
      temp=s.substring(place,++place);
    }

    this.numLocks=int.parse(sizes);
    print('Num locks:');
    print(this.numLocks);
    temp=s.substring(place,++place);
    sizes='';
    while(temp!=' '){
      sizes=sizes+temp;
      temp=s.substring(place,++place);
    }
    this.size=int.parse(sizes)*int.parse(sizes);
    print('Size:');
    print(this.size);
    print('Num Locks');
    print(this.numLocks);
  } 
  

  bool swipeCheck(SwipeDirection direction, int _onIndex, int _currentColorState){
    if(direction == SwipeDirection.down){
      return(_onIndex+columns <= size-1 && 
      !boxes[_onIndex+columns].isWall && 
      (boxes[_onIndex+columns].colorState==0 || 
      boxes[_onIndex+columns].colorState==_currentColorState));
    }else if(direction == SwipeDirection.up){
      return(_onIndex-columns >=0 && 
      !boxes[_onIndex-columns].isWall && 
      (boxes[_onIndex-columns].colorState==0 || 
      boxes[_onIndex-columns].colorState==_currentColorState));
    }else if(direction == SwipeDirection.right){
      return((_onIndex+1)%columns != 0  && 
      !boxes[_onIndex+1].isWall && 
      (boxes[_onIndex+1].colorState==0 || 
      boxes[_onIndex+1].colorState==_currentColorState));
    }else if(direction == SwipeDirection.left){
      return(_onIndex%columns != 0 && 
      !boxes[_onIndex-1].isWall && 
      (boxes[_onIndex-1].colorState==0 || 
      boxes[_onIndex-1].colorState==_currentColorState));
    }
    return false;
  }
}