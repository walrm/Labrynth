import 'package:flutter/material.dart';

import 'game.dart';
import 'grid.dart';

class GameContainer extends StatefulWidget {
  Grid grid;
  GameContainer(this.grid);

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
            Game(widget.grid),
          ]
        ),
      )
    );
  }
}