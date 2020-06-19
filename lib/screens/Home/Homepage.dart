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

  Future<SaveState> initSaveState() async {
    SaveState save = new SaveState();
    await save.init();
    widget.worlds[0] = new World();
    await widget.worlds[0].init();
    return save;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SaveState>(
        future: initSaveState(),
        builder: (BuildContext context, AsyncSnapshot<SaveState> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: AppBar( 
                  backgroundColor: Colors.black, 
                )
              ),
              body: Stack(children: <Widget>[
                PageView.builder(
                  itemBuilder: (context, index) {
                    int currentWorld = index + 1;
                    Icon icon;
                    ImageProvider img;
                    bool goToGame;
                    if (currentWorld == 1) {
                      icon =
                          Icon(Icons.play_circle_outline, color: Colors.green);
                      img = AssetImage("assets/nature.jpg");
                      print("Coins:");
                      print(snapshot.data.coins);
                      goToGame = true;
                    } else if (currentWorld == 2) {
                      icon = Icon(Icons.lock_outline, color: Colors.grey);
                      img = AssetImage("assets/ocean.jpg");
                      goToGame = false;
                    } else {
                      icon = Icon(Icons.lock_outline, color: Colors.grey);
                      img = AssetImage("assets/fire.jpg");
                      goToGame = false;
                    }
                    return Stack(children: <Widget>[
                      Container(
                        child: Center(
                            child: IconButton(
                          iconSize: 120,
                          icon: icon,
                          onPressed: () {
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
                        )),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          child: Text('$currentWorld/$totalWorlds',
                              style: TextStyle(
                                  fontSize: 60.0, color: Colors.white))),
                    ]);
                  },
                  itemCount: 10, // Can be null
                ),
                Positioned(
                  //Box to hold coins
                  top: 40,
                  right: 10,
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: <Widget>[
                            Text(
                              '${snapshot.data.coins}',
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Colors.black,
                              ),
                            ),
                            Text(
                              '${snapshot.data.coins}',
                              style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // Box to hold gems
                  top: 82,
                  right: 10,
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${snapshot.data.gems}',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${snapshot.data.gems}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage('assets/scuffedGem.png'),
                            )  
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            );
          } else {
            return SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
          }
        });
  }
}
