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
        width: (2*width) / 3,
        height: height / 3,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0,-.85),
                child: Text(
                  'Level Complete!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0,-.2),
                child: Stack(
                  children:<Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: height/10,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: height/10,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: height/10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: height/10,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_border,
                          size: height/10,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_border,
                          size: height/10,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0,.85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color:Colors.grey,
                        child:InkWell(
                          splashColor:Colors.lightBlue,
                          child: SizedBox(
                            width: height/10, 
                            height: height/10, 
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
                    ClipOval(
                      child: Material(
                        color:Colors.grey,
                        child:InkWell(
                          splashColor:Colors.lightBlue,
                          child: SizedBox(
                            width: height/10, 
                            height: height/10, 
                            child: Icon(Icons.apps),
                          ),
                          onTap:(){
                            Navigator.pop(context);
                          },
                        ),
                      ), 
                    ),
                    ClipOval(
                      child: Material(
                        color:Colors.grey,
                        child:InkWell(
                          splashColor:Colors.lightBlue,
                          child: SizedBox(
                            width: height/10, 
                            height: height/10, 
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

                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}