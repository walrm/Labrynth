import '../../widgets/saveState.dart';
import 'package:flutter/material.dart';

import 'game.dart';
import 'grid.dart';

class GameContainer extends StatefulWidget {
  Grid grid;
  final SaveState data; //all of the backend stored stuff
  final int currentWorld; //integer for the current world-starts from 1
  final int currentLevel; //Level number in the world-starts from 1
  final int numPuzzles; 

  GameContainer(this.grid, this.data, this.currentWorld, this.currentLevel, this.numPuzzles);

  @override
  GameContainerState createState() => GameContainerState();

}    

class GameContainerState extends State<GameContainer>{
  @override
  Widget build(BuildContext context){
    Game game = Game(widget.grid, widget.data, widget.currentWorld, widget.currentLevel, widget.numPuzzles);
    return Scaffold(
      appBar:AppBar(
        title: Text('Game'),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              disabledColor: Colors.white,
              onPressed: (){
                if(!game.win){
                  setState((){
                    game.reset();
                  });
                }
              },
            ),
        ],
      ),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            game
          ],
        ),
      ),
    );
  }
}