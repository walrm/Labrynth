import 'package:flutter/material.dart';

import 'game.dart';
import 'grid.dart';

class GameContainer extends StatelessWidget {
  Grid grid;

  GameContainer(this.grid);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Game')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Game(grid)]
        ),
      )
    );
  }
}