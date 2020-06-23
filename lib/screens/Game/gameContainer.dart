import '../../widgets/saveState.dart';
import 'package:flutter/material.dart';

import 'game.dart';
import 'grid.dart';

class GameContainer extends StatefulWidget {
  Grid grid;
  final SaveState data; //all of the backend stored stuff
  final int currentWorld; //integer for the current world-starts from 1
  final int currentLevel; //Level number in the world-starts from 1
  GameContainer(this.grid, this.data, this.currentWorld, this.currentLevel);

  @override
  GameContainerState createState() => GameContainerState();

}    

class GameContainerState extends State<GameContainer>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Game')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Game(widget.grid, widget.data, widget.currentWorld, widget.currentLevel),
          ]
        ),
      )
    );
  }
}