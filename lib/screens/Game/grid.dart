import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'box.dart';

class Grid{
  int size;
  int numLocks;
  int columns;
  List<Box> boxes;

  reset(){
    for(int l=0; l<boxes.length; l++){
      if(boxes[l].type == Type.normal)
      boxes[l]=new Box(l,Colors.white,false,Type.normal,0);
    }
  }

  bool swipeCheck(SwipeDirection direction, int _onIndex, int _currentColorState){
    if(direction == SwipeDirection.down){
      return(_onIndex+columns <= size-1 && 
      !boxes[_onIndex+columns].isWall() && 
      (boxes[_onIndex+columns].colorState==0 || 
      boxes[_onIndex+columns].colorState==_currentColorState));
    }else if(direction == SwipeDirection.up){
      return(_onIndex-columns >=0 && 
      !boxes[_onIndex-columns].isWall() && 
      (boxes[_onIndex-columns].colorState==0 || 
      boxes[_onIndex-columns].colorState==_currentColorState));
    }else if(direction == SwipeDirection.right){
      return((_onIndex+1)%columns != 0  && 
      !boxes[_onIndex+1].isWall() && 
      (boxes[_onIndex+1].colorState==0 || 
      boxes[_onIndex+1].colorState==_currentColorState));
    }else if(direction == SwipeDirection.left){
      return(_onIndex%columns != 0 && 
      !boxes[_onIndex-1].isWall() && 
      (boxes[_onIndex-1].colorState==0 || 
      boxes[_onIndex-1].colorState==_currentColorState));
    }
    return false;
  }
    bool checkWin(index){
    if(boxes[index].type==Type.end){
      return true;
    }
    return false;
  }
}