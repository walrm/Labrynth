import 'package:Labrynth_test/world.dart';
import 'package:flutter/material.dart';
import 'package:Labrynth_test/screens/Game/saveState.dart';
import '../Map/worldmap.dart';

class Homepage extends StatefulWidget{
  int currentWorld=0;
  static int totalWorlds=10;
  List<World> worlds = new List<World>(totalWorlds);

  @override
  Homestate createState() => Homestate();
}

class Homestate extends State<Homepage> {
  int totalWorlds = Homepage.totalWorlds;

  PageController _controller = PageController(
    initialPage: 2,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<SaveState> initSaveState() async{
    SaveState save=new SaveState();
    await save.init();
    widget.worlds[0] = new World();
    await widget.worlds[0].init();
    return save;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SaveState>(
      future: initSaveState(),
      builder: (BuildContext context, AsyncSnapshot<SaveState> snapshot){
        if(snapshot.hasData){
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: AppBar( // Here we create one to set status bar color
                  backgroundColor: Colors.black, // Set any color of status bar you want; or it defaults to your theme's primary color
                )
              ),
              body: PageView.builder(
              itemBuilder: (context, index) {
                int currentWorld = index+1;
                Icon icon;
                ImageProvider img;
                bool goToGame;
                if (currentWorld == 1){
                  icon = Icon(Icons.play_circle_outline, color:Colors.green);
                  img = AssetImage("assets/nature.jpg");
                  print("Coins:");
                  print(snapshot.data.coins);
                  goToGame = true;
                }
                else if (currentWorld == 2){
                  icon = Icon(Icons.lock_outline, color:Colors.grey);
                  img = AssetImage("assets/ocean.jpg");
                  goToGame = false;

                }
                else{
                  icon = Icon(Icons.lock_outline, color:Colors.grey);
                  img = AssetImage("assets/ocean.jpg");
                  goToGame = false;
                }
                return Stack(
                  children: <Widget> [
                    Container(
                      child: Center(
                        child: IconButton(
                          iconSize: 120,
                          icon: icon,
                          onPressed: (){
                            if (goToGame){
                              // bool test=false;
                              // Navigator.pushNamed(
                              //   context,
                              //   '/game',
                              //   arguments: <bool>{
                              //     test,
                              //   }
                              //   );
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Map(widget.worlds[0])
                                )
                               );
                              }
                          },
                        )
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      child: Text('$currentWorld/$totalWorlds', style: TextStyle(fontSize: 60.0, color: Colors.white))
                    ),
                  ]
                );
              },
              itemCount: 10, // Can be null
              )
            );
        }
        else{
          return SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          );
        }
      }
    );

  }
}