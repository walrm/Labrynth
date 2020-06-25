import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'box.dart';

class Grid{
  int size;
  int numLocks;
  int columns;
  int startIndex;
  List<Box> boxes;

  reset(){
    for(int l=0; l<boxes.length; l++){
      if(boxes[l].type == Type.normal)
        boxes[l]=new Box(l,Colors.white,false,Type.normal,'0');
    }
  }

  bool swipeCheck(SwipeDirection direction, int _onIndex, List<String> colorStates){
    if(direction == SwipeDirection.down){
      if(boxes[_onIndex+columns].isLock()){
        return(_onIndex+columns <= size-1 && 
        !boxes[_onIndex+columns].isWall() &&
        colorStates.contains(boxes[_onIndex+columns].colorState.toLowerCase()));
      }else {
        return(_onIndex+columns <= size-1 && 
        !boxes[_onIndex+columns].isWall());
      } 
    }else if(direction == SwipeDirection.up){
      if(boxes[_onIndex-columns].isLock()){
        return(_onIndex-columns >=0 && 
        !boxes[_onIndex-columns].isWall()&&
        colorStates.contains(boxes[_onIndex-columns].colorState.toLowerCase()));  
      }else {
        return(_onIndex-columns >=0 && 
        !boxes[_onIndex-columns].isWall());
      }
    }else if(direction == SwipeDirection.right){
      if(boxes[_onIndex+1].isLock()){
        return((_onIndex+1)%columns != 0  && 
        !boxes[_onIndex+1].isWall() &&
        colorStates.contains(boxes[_onIndex+1].colorState.toLowerCase()));
      }else {
        return((_onIndex+1)%columns != 0  && 
        !boxes[_onIndex+1].isWall());
      }
    }else if(direction == SwipeDirection.left){
      if(boxes[_onIndex-1].isLock()){
        return(_onIndex%columns != 0 && 
        !boxes[_onIndex-1].isWall() &&
        colorStates.contains(boxes[_onIndex-1].colorState.toLowerCase()));
      }
      return(_onIndex%columns != 0 && 
      !boxes[_onIndex-1].isWall());
    }
    return false;
  }
  
  bool checkWin(index){
      return boxes[index].type==Type.end;
  }
}