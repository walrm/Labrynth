import 'package:Labrynth_test/screens/Game/gameContainer.dart';
import 'package:Labrynth_test/widgets/saveState.dart';
import 'package:flutter/material.dart';

import '../../widgets/world.dart';

class Map extends StatefulWidget{
  int onIndex;
  World world;

  final SaveState data; //all of the backend stored stuff
  final int currentWorld; //integer for the current world-starts from 1

  Map(this.world, this.data, this.currentWorld);

  @override
  Worldmap createState() => Worldmap();
}

class Worldmap extends State<Map>{
  int worldNum;
  
  @override
  Widget build(BuildContext context){
    Widget child;
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(widget.world.puzzles.length, (index) {
            worldNum = index+1;
            try{
              if(widget.data.levelStr[widget.currentWorld].substring(index,index+1) == "0"){
                if(index == widget.onIndex){
                  child = InkWell(
                    splashColor: Colors.blue,
                    onTap: (() async {
                      widget.world.puzzles[widget.onIndex].reset();
                      var navigationResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameContainer(
                            widget.world.puzzles[widget.onIndex], widget.data, widget.currentWorld, widget.onIndex, widget.world.puzzles.length
                          )
                        )
                      );
                      setState((){ });
                      while(navigationResult == 'next' && widget.onIndex+1 < widget.world.puzzles.length) {
                        setState((){
                          widget.onIndex++;
                        });
                        navigationResult = await Navigator.push(context, MaterialPageRoute(
                          builder: (context) => GameContainer(
                            widget.world.puzzles[widget.onIndex], widget.data, widget.currentWorld, widget.onIndex, widget.world.puzzles.length
                          )
                        ));
                      }
                    }),
                    child: Center(child: Icon(Icons.play_circle_filled))
                  );
                }else{
                  child = InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      setState((){
                        widget.onIndex = index;
                      });
                    },
                    child: Center(
                      child: Text('$worldNum')
                    )
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: child
                );
              }
            }on RangeError{
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: Icon(Icons.lock)
              );
            }
          })
        )
      )
    );
  }
}