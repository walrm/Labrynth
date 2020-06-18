import 'package:Labrynth_test/screens/Game/gameContainer.dart';
import 'package:flutter/material.dart';

import '../../world.dart';

class Map extends StatefulWidget{
  int onIndex;
  World world;

  Map(this.world);

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
          children: List.generate(20, (index) {
            worldNum = index+1;
            if(index == widget.onIndex){
              child = InkWell(
                splashColor: Colors.blue,
                onTap: ((){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameContainer(widget.world.puzzles[index])
                    )
                  );
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
          })
        )
      )
    );
  }
}