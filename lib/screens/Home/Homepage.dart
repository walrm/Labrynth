import '../../widgets/world.dart';
import 'package:flutter/material.dart';
import 'package:Labrynth_test/widgets/saveState.dart';
import '../Map/worldmap.dart';

class Homepage extends StatefulWidget{
  int currentWorld=0;
  static int totalWorlds=3;
  List<World> worlds = new List<World>(totalWorlds);

  @override
  Homestate createState() => Homestate();
}

class Homestate extends State<Homepage> {
  int totalWorlds = Homepage.totalWorlds;
  List<AssetImage> bgImages = 
  [AssetImage("assets/nature.jpg"),AssetImage("assets/ocean.jpg"),AssetImage("assets/fire.jpg")];

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

    for(int i=0; i<Homepage.totalWorlds; i++){
      widget.worlds[i] = new World();
      await widget.worlds[i].init(i.toString());
    }
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
                    Icon icon;
                    bool play = false;
                    try{
                      if(snapshot.data.levelStr[index]!= null){
                        icon = Icon(Icons.play_circle_outline, color: Colors.green);
                        play = true;
                      }
                    }on RangeError{
                      icon = Icon(Icons.lock_outline, color: Colors.grey);
                    }
                    return Stack(children: <Widget>[
                      Container(
                        child: Center(
                          child: IconButton(
                            iconSize: 120,
                            icon: icon,
                            onPressed: () {
                              if(play)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Map(widget.worlds[index], snapshot.data, index)
                                  )
                                ).then((value)=>{
                                  setState((){})
                                }
                              );
                            },
                          )
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: bgImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ]);
                  },
                  itemCount: Homepage.totalWorlds, // Can be null
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
                                fontSize: 24,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.black,
                              ),
                            ),
                            Text(
                              '${snapshot.data.coins}',
                              style: TextStyle(
                                letterSpacing: 1,
                                //fontWeight: FontWeight.bold,
                                fontSize: 24,
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
                              image: AssetImage('assets/scuffedGem2.0.png'),
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
