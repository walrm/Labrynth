import 'package:flutter/material.dart';
import 'package:Labrynth_test/screens/Home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(
      //     // leading: //optional (left side app bar)
      //     title: Text('Help'),
      //     // actions: //optional (right side app bar)
      //   ),
      //   // body: Homepage(),
      //   // body: Column(
      //   //   mainAxisAlignment: MainAxisAlignment.center,
      //   //   crossAxisAlignment: CrossAxisAlignment.center,
      //   //   children: [Game()]
      //   // )
      // ),
      routes: {
        '/': (context) => Home(),
      }
    );
  }
}