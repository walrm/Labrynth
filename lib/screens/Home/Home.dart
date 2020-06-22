import 'package:flutter/material.dart';
import 'package:Labrynth_test/screens/Game/saveState.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:Labrynth_test/screens/Home/Homepage.dart';
import 'package:google_fonts/google_fonts.dart';


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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                  child: Container(
                    width: screenWidth,
                    height: screenHeight,
                    /*child: Stack(//Trying out buttons at the bottom
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0,.33),
                          child:Stack(
                            children: <Widget>[
                              Opacity(
                                opacity:.95,
                                child: Icon(
                                    Icons.play_circle_filled,
                                    size:100,
                                    color: Colors.grey,
                                ),
                              ),
                              Opacity(
                                opacity:1,
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.black,
                                  ),
                                  iconSize: 100,
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context)=>Homepage()
                                      )
                                    );
                                  },
                                ),
                              ),
                            ]), 
                        ),
                        Align(
                          alignment: Alignment(-.7,.6),
                          child:Stack(
                            children: <Widget>[
                              Opacity(
                                opacity:1,
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.settings,
                                    color: Colors.black,
                                  ),
                                  iconSize: 80,
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context)=>Homepage()
                                      )
                                    );
                                  },
                                ),
                              ),
                            ]), 
                        ),
                        Align(
                          alignment: Alignment(.7,.6),
                          child:Stack(
                            children: <Widget>[
                              Opacity(
                                opacity:1,
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.black,
                                  ),
                                  iconSize: 80,
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context)=>Homepage()
                                      )
                                    );
                                  },
                                ),
                              ),
                            ]), 
                        ),
                    ]),*/
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0,-.3),
                          child:InkWell(
                            onTap:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context)=>Homepage()
                                )
                              );
                            },
                            child: Container(
                              height:80,
                              width:200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.red,Colors.deepOrange,Colors.yellow],
                                  stops:[0.0,.3,1],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                ),
                                border: Border.all(width:6,color:Colors.black),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Play',
                                  style:  GoogleFonts.roboto(
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0,.1),
                          child: Container(
                            height:80,
                            width:200,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.red,Colors.deepOrange,Colors.yellow],
                                stops:[0.0,.3,1],
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                              ),
                              border: Border.all(width:6,color:Colors.black),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Settings',
                                style:  GoogleFonts.roboto(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0,.5),
                          child:InkWell(
                            onTap:(){




                            },
                            child: Container(
                              height:80,
                              width:200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.red,Colors.deepOrange,Colors.yellow],
                                  stops:[0.0,.3,1],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                ),
                                border: Border.all(width:6,color:Colors.black),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Shop',
                                  style:  GoogleFonts.roboto(
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],





                    ),
                  ),
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