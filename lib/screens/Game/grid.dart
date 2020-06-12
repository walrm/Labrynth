import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'box.dart';



class Grid{
  int size;
  int numLocks;
  int columns;
  List<Box> boxes;

  Grid(){
    // boxes = new List<Box>(this.size);
    // for(int i=0; i<this.size; i++){
    //   boxes[i]=new Box(i,Colors.white,false,false,0);
    // }
    init('data.txt');    
    //Temporary
    // boxes[0].visited=true;
    // boxes[1].isWall = true;
    // boxes[8].colorState = 1;
  }

  Future<void> init(String filename) async{
    await readFile('data.txt');
  }

  Future<String> loadAsset(String filename) async {
    return await rootBundle.loadString('assets/'+filename);
  }

  Future<void> readFile(String filename) async{
    String s = await loadAsset(filename);
    int i = 0;
    while(s[i] != ' '){
      i++;
    }
    i++;
    String str = "";
    while(s[i] != '\n'){
      str += s[i];
      i++;
    }
    
    int size = int.parse(str);
    columns = size;
    this.size = size*size;
    boxes = new List<Box>(size*size);
    for(int l=0; l<boxes.length; l++){
      boxes[l]=new Box(l,Colors.white,false,false,0);
    }

    int j = 0;
    for(i=i+1; i<s.length; i++){
        while(i!=s.length && s[i] != '\n'){
          if(s[i] == '#'){
            boxes[j].isWall = true;
          }
          j++;
          i++;
        }
      i++;
    }
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