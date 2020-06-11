import 'package:Labrynth_test/screens/game.dart';
import 'package:Labrynth_test/screens/Homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // leading: //optional (left side app bar)
          title: Text('Help'),
          // actions: //optional (right side app bar)
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Homepage()]
        )
      ),
    );
  }
}