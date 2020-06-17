import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:Labrynth_test/screens/Game/saveState.dart';

class Homepage extends StatefulWidget{
  @override
  Homestate createState() => Homestate();
}


class Homestate extends State<Homepage> {
  int currentWorld=0;
  int totalWorlds=10;
  bool isInit=true;

  _horizontalSwipe(SwipeDirection direction){
    if(direction==SwipeDirection.left && currentWorld!=0){
    setState(() {
        currentWorld--;
      });
    }
    else if(direction==SwipeDirection.right&&currentWorld+1<totalWorlds){
      setState(() {
        currentWorld++;
      });
    }
  }

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<SaveState> initSaveState() async{
    SaveState save=new SaveState();
    await save.init();
    return save;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SaveState>(
      future: initSaveState(),
      builder: (BuildContext context, AsyncSnapshot<SaveState> snapshot){
        if(snapshot.hasData){
            return Scaffold(
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
                              bool test=false;
                              Navigator.pushNamed(
                                context,
                                '/game',
                                arguments: <bool>{
                                  test,
                                }
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