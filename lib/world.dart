import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/Game/box.dart';
import 'screens/Game/grid.dart';

class World {
  List<Grid> puzzles;

  World(){
    puzzles = new List<Grid>();
  }

  Future<List<String>> loadAsset() async {
    List<String> data = List<String>();
    await rootBundle.loadString('assets/data.txt').then((q){
      for (String i in LineSplitter().convert(q)) {
        data.add(i);
      }
    }
    );
    return data;
  }

  Future<void> readFile() async{
    List<String> data = await loadAsset();
    String s = "";
    
    for(int index = 0; index<data.length; index++){
      s+= data[index++];
      while(!data.contains('World') && index<data.length){
        s+=data[index];
        index++;
      }
      int i =0;
      while(s[i] != ' '){
        i++;
      }
      i++;
      while(i != s.length){
        i = createPuzzle(s,i);
      }
      s = "";
    }
  } 

  int createPuzzle(String s, int i){
    Grid g = new Grid();
    while(s[i] != ' '){
      i++;
    }
    i++;
    String str = "";
    while(s[i] != ' '){
      str += s[i];
      i++;
    }
    i++;
    
    int n = int.parse(str);
    g.columns = n;
    g.size = n*n;
    g.boxes = new List<Box>(n*n);
    for(int l=0; l<g.boxes.length; l++){
      g.boxes[l]=new Box(l,Colors.white,false,Type.normal,0);
    }

    int j = 0;
    while(i!=s.length && s[i] != ' '){
      if(s[i] == '#'){
        g.boxes[j].type = Type.wall;
      }
      j++;
      i++;
    }
    i++;
    puzzles.add(g);
    return i;
  }

  Future<void> init() async{
    await readFile();
  }
}