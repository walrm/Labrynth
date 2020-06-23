import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LevelComplete extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: (2 * width) / 3,
        height: height / 3,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Level Complete!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,//Home button
                child: ClipOval(
                  child: Material(
                    color:Colors.grey,
                    child:InkWell(
                      splashColor:Colors.lightBlue,
                      child: SizedBox(
                        width: height/12, 
                        height: height/12, 
                        child: Icon(
                          Icons.home
                        ),
                      ),
                      onTap:(){
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      }
                      ),
                    ),
                  ), 
                ),
              Align(
                alignment: Alignment.bottomCenter,//Map Button       
                child: ClipOval(
                  child: Material(
                    color:Colors.grey,
                    child:InkWell(
                      splashColor:Colors.lightBlue,
                      child: SizedBox(
                        width: height/12, 
                        height: height/12, 
                        child: Icon(Icons.apps),
                      ),
                      onTap:(){
                        Navigator.pop(context);
                      },
                    ),
                  ), 
                ),
              ),
              Align(
                alignment: Alignment.bottomRight, //Next level button
                child: ClipOval(
                  child: Material(
                    color:Colors.grey,
                    child:InkWell(
                      splashColor:Colors.lightBlue,
                      child: SizedBox(
                        width: height/12, 
                        height: height/12, 
                        child: Icon(
                          Icons.arrow_forward
                        )
                      ),
                      onTap:(){
                        Navigator.pop(context, 'next');
                      },
                    ),
                  ), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}