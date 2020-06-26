import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Homepage extends StatefulWidget{
  @override
  Homestate createState() => Homestate();
}

Future<List<String>> gettingProgressData() async{
  final prefs = await SharedPreferences.getInstance();
  List<String> abc=new List<String>();
  abc.add("test");
  prefs.setStringList('test', abc);
  List<String> test=prefs.getStringList('test');
  return test;

}

class Homestate extends State<Homepage> {
  int currentWorld=0;
  int totalWorlds=10;
   _horizontalSwipe(SwipeDirection direction){
     if(direction==SwipeDirection.left&&currentWorld!=0){
       currentWorld--;
     }
     else if(direction==SwipeDirection.right&&currentWorld+1<totalWorlds){
       setState(() {
         currentWorld++;
       });
     }
  }
  @override
 Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
          future: gettingProgressData(),
          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot){
            if(snapshot.hasData){
              print("It worked");
              print(snapshot.data.elementAt(0));
              return SimpleGestureDetector(
                onHorizontalSwipe: _horizontalSwipe,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ocean.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: null,
                ),
              );
            }
            else{
              print('It didnt work?');
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