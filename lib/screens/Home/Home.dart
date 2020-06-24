import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/saveState.dart';
import 'package:flutter/rendering.dart';
import 'package:Labrynth_test/screens/Home/Homepage.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget{
  @override
  HomeScreen createState() => HomeScreen();


}

class HomeScreen extends State<Home>{
  bool isSettings=false;


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
                    child: Stack(
                      children: <Widget>[
                        Align(//Play Button
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
                        Align(//Settings Button
                          alignment: Alignment(0,.1),
                          child: InkWell(
                            onTap: (){
                              print('tapped');
                              setState(() {
                                isSettings=true;
                                print(isSettings);
                              });
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
                                  'Settings',
                                  style:  GoogleFonts.roboto(
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(//Shop Button
                          alignment: Alignment(0,.5),
                          child:InkWell(
                            onTap:(){
                              if(!isSettings){

                              }
                              else{
                                
                              }
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
                        if(isSettings)//Settings box, if visible
                          AnimatedOpacity(
                            opacity: 1.0,
                            
                            duration: Duration(milliseconds: 250),
                            child: Align(
                              alignment:Alignment.center,
                              child: Container(
                                height: (screenHeight/2.5),
                                width: (screenWidth/4)*3,
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(
                                    color: Colors.black,
                                    width: 5,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child:Text(
                                        'Settings',
                                        style: GoogleFonts.roboto(
                                          color:Colors.black,
                                          fontSize: 40, 
                                        ),
                                      ),
                                    ),
                                    Align(//Cancel button
                                      alignment: Alignment.bottomLeft,
                                      child:InkWell(
                                        onTap: (){
                                          setState(() {
                                            isSettings=false;
                                          });
                                        },
                                        child:Container(
                                          height: ((screenHeight/2)/8)*1.1,
                                          width: (screenWidth/12)*3*1.1,
                                          decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            border: Border.all(
                                              color: Colors.black,
                                              width:5,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child:Text(
                                              'Cancel',
                                              style: GoogleFonts.roboto(
                                                fontSize: 24,
                                                color: Colors.black,
                                              ),
                                            )
                                          )
                                        ),
                                      ),
                                    ),
                                    Align(//Settings button
                                      alignment: Alignment.bottomRight,
                                      child:InkWell(
                                        onTap: (){
                                          setState(() {
                                            isSettings=false;
                                          });
                                        },
                                        child:Container(
                                          height: ((screenHeight/2)/8)*1.1,
                                          width: (screenWidth/12)*3*1.1,
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen,
                                            border: Border.all(
                                              color: Colors.black,
                                              width:5,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child:Text(
                                              'Confirm',
                                              style: GoogleFonts.roboto(
                                                fontSize: 24,
                                                color: Colors.black,
                                              ),
                                            )
                                          )
                                        ),
                                      ),
                                    ),
                                  ],
                                )
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