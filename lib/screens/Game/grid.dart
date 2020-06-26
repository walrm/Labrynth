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
    bool rangeCheck;
    int newIndex;
    if(direction == SwipeDirection.down){
      rangeCheck = _onIndex+columns <= size-1;
      newIndex = _onIndex+columns;
    }else if(direction == SwipeDirection.up){
      rangeCheck = _onIndex-columns >=0;
      newIndex = _onIndex-columns;
    }else if(direction == SwipeDirection.right){
      rangeCheck = (_onIndex+1)%columns != 0;
      newIndex = _onIndex+1;
    }else if(direction == SwipeDirection.left){
      rangeCheck = _onIndex%columns != 0;
      newIndex = _onIndex-1;
    }

    if(!rangeCheck)
      return false;
    else if(boxes[newIndex].isLock()){
      return(!boxes[newIndex].isWall() && 
      colorStates.contains(boxes[newIndex].colorState.toLowerCase()));
    }
    return !boxes[newIndex].isWall();
  }
  
  bool checkWin(index){
      return boxes[index].type==Type.end;
  }
}