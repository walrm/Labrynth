import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/saveState.dart';
import 'package:flutter/rendering.dart';
import 'package:Labrynth_test/screens/Home/Homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Home> {
  bool isSettings = false;
  double opacity = 0;
  //int currentVolume;
  int volume = 0;
  bool notifications=false;

  Future<SaveState> initSaveState() async {
    SaveState save = new SaveState();
    await save.init();
    return save;
  }

  Text text(String text, String font, double fontSize, Color c, double letterSpacing) {
    return Text(
      '$text',
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        color: c,
      ),
    );
  }

  void toggleCheckbox() {
    setState(() {
      notifications = !notifications;
    });
  }

  Checkbox notificationIcon(bool notif) {
    return Checkbox(
      value: notif,
      onChanged: (notif) {
        toggleCheckbox();
      },
      tristate: false,
      activeColor: Colors.blue,
      checkColor: Colors.white,
    );
  }

  IconButton volumeIcon(int x) {
    switch (x) {
      case 0:
        {
          return IconButton(
            icon: new Icon(
              Icons.volume_mute,
              color: Colors.blue,
              size: 32,
            ),
            onPressed: () {
              setState(() {
                volume++;
              });
            },
          );
        }
        break;
      case 1:
        {
          return IconButton(
            icon: new Icon(
              Icons.volume_down,
              color: Colors.blue,
              size: 32,
            ),
            onPressed: () {
              setState(() {
                volume++;
              });
            },
          );
        }
        break;
      case 2:
        {
          return IconButton(
            icon: new Icon(
              Icons.volume_up,
              color: Colors.blue,
              size: 32,
            ),
            onPressed: () {
              setState(() {
                volume = 0;
              });
            },
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double settingsHeight = screenHeight / 2.5;
    double settingsWidth = screenWidth / 4 * 3;
    return FutureBuilder<SaveState>(
        future: initSaveState(),
        builder: (BuildContext context, AsyncSnapshot<SaveState> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: AppBar(
                  backgroundColor: Colors.black,
                ),
              ),
              body: Stack(children: <Widget>[
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
                        IgnorePointer(
                          ignoring: isSettings,
                          child: Align(
                            //Play Button
                            alignment: Alignment(0, -.3),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()));
                              },
                              child: Container(
                                height: 80,
                                width: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.deepOrange,
                                      Colors.yellow
                                    ],
                                    stops: [0.0, .3, 1],
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                  ),
                                  border:
                                      Border.all(width: 6, color: Colors.black),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Play',
                                    style: GoogleFonts.roboto(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          //Settings Button
                          ignoring: isSettings,
                          child: Align(
                            alignment: Alignment(0, .1),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSettings = true;
                                  this.volume = snapshot.data.volume;
                                  this.notifications = snapshot.data.notifications;
                                  opacity = 1;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.deepOrange,
                                      Colors.yellow
                                    ],
                                    stops: [0.0, .3, 1],
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                  ),
                                  border:
                                      Border.all(width: 6, color: Colors.black),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Settings',
                                    style: GoogleFonts.roboto(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          ignoring: isSettings,
                          child: Align(
                            //Shop Button
                            alignment: Alignment(0, .5),
                            child: InkWell(
                              onTap: () {
                                if (!isSettings) {
                                } else {}
                              },
                              child: Container(
                                height: 80,
                                width: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.deepOrange,
                                      Colors.yellow
                                    ],
                                    stops: [0.0, .3, 1],
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                  ),
                                  border:
                                      Border.all(width: 6, color: Colors.black),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Shop',
                                    style: GoogleFonts.roboto(
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          ignoring: !isSettings,
                          child: AnimatedOpacity(
                            opacity: opacity,
                            duration: Duration(milliseconds: 125),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: settingsHeight,
                                  width: settingsWidth,
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 5,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'Settings',
                                          style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 40,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 30,),
                                          text("Music", "roboto", 24,
                                              Colors.black, -1),
                                          Spacer(),
                                          volumeIcon(this.volume),
                                          SizedBox(width: 40,),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 30,),
                                          text("Notifications", "null", 24,
                                              Colors.black, -1),
                                          Spacer(),
                                          SizedBox(width:33),
                                          // notificationIcon(notifications),
                                          SizedBox(width: 40,),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isSettings = false;
                                                opacity = 0;
                                              });
                                            },
                                            child: Container(
                                              height: ((screenHeight / 2) / 8) *
                                                  1.1,
                                              width:
                                                  (screenWidth / 12) * 3 * 1.1,
                                              decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 5,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: text("Cancel", "null",
                                                    24, Colors.black, 0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                snapshot.data.volume = volume;
                                                snapshot.data.notifications=notifications;
                                                snapshot.data.write();
                                                isSettings = false;
                                                opacity = 0;
                                              });
                                            },
                                            child: Container(
                                              height: ((screenHeight / 2) / 8) *
                                                  1.1,
                                              width:
                                                  (screenWidth / 12) * 3 * 1.1,
                                              decoration: BoxDecoration(
                                                color: Colors.lightGreen,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 5,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Confirm',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            );
          } else {
            return SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
          }
        });
  }
}
