import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Homepage extends StatefulWidget{
  @override
  Homestate createState() => Homestate();
}


class Homestate extends State<Homepage> {
  int currentWorld=0;
  int totalWorlds=10;

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

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pushNamed(context, '/game');
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
}