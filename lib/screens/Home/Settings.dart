import 'package:flutter/material.dart';
import 'package:Labrynth_test/widgets/saveState.dart';
import 'package:flutter/rendering.dart';
import 'package:Labrynth_test/screens/Home/Homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget{
  @override
  SettingsState createState() =>SettingsState();
}



class SettingsState extends State<Settings>{


  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width:screenWidth,
      height: screenHeight,
      child: Stack(
        children: <Widget>[





        ],




      ),
    );
  }
}