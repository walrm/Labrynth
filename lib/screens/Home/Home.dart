import 'package:Labrynth_test/world.dart';
import 'package:flutter/material.dart';
import 'package:Labrynth_test/screens/Game/saveState.dart';
import 'package:flutter/rendering.dart';


class Home extends StatefulWidget{
  @override
  HomeScreen createState() => HomeScreen();


}

class HomeScreen extends State<Home>{

  Future<SaveState> initSaveState() async{
    SaveState save=new SaveState();
    await save.init();
    return save;
  }




  @override
  Widget build(BuildContext context){
    return FutureBuilder<SaveState>(
      future: initSaveState(),
      builder: (BuildContext context, AsyncSnapshot<SaveState> snapshot) {
        if(snapshot.hasData) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBar(
                backgroundColor: Colors.black,
              ),
            ),
            body: Stack(
              children:<Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/scuffedBackground.png'),
                    ),
                  ),
                ),
                Container(//Home Page?
                  child: Align
                ),
            ]),
          );
        }
        else{
          return SizedBox(
            child: CircularProgressIndicator(),
            width:60,
            height:60,
          );
        }
      }
    );
  }
}