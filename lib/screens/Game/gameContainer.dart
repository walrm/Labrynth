import 'package:flutter/material.dart';

import 'game.dart';
import 'grid.dart';

class GameContainer extends StatelessWidget {
  Grid grid;

  Future<Grid> initGrid() async{
    grid = new Grid();
    return grid;
  }

  @override
  Widget build(BuildContext context){
     return FutureBuilder<Grid>(
      future: initGrid(),
      builder: (BuildContext context, AsyncSnapshot<Grid> snapshot){
        if(!snapshot.hasData){
          return Center(child: Text("Loading..."));
        }else return Game(grid);
      }
    );
  }
}