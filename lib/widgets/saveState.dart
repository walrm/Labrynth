
import 'package:shared_preferences/shared_preferences.dart';

class SaveState{
  int stars;
  int coins;
  int gems;
  List<String> levelStr;//0: unlocked,1: star,2: 2 star,3: 3 star,4:locked
  String lastLogin;
  int day;
  List<String> colors;
  int skips;
  String coinMap;
  SharedPreferences prefs;
  int volume;//0:off,1:medium,2:loud

  saveState() async{
    await init(); 
  }
  Future<void> init() async{
    this.prefs= await SharedPreferences.getInstance();
    if(prefs.containsKey('stars')){
      this.stars=prefs.getInt('stars');
    }
    else{
      this.stars=0;
    }
    if(prefs.containsKey('coins')){
      this.coins=prefs.getInt('coins');
    }
    else{
      this.coins=0;
    }
    if(prefs.containsKey('levelstr')){
      this.levelStr=prefs.getStringList('levelstr');
    }
    else{
      this.levelStr=['0'];
    }
    if(prefs.containsKey('lastLogin')){
      this.lastLogin=prefs.getString('lastLogin');
    }
    else{
      var now =new DateTime.now();
      this.lastLogin=now.toString();
    }
    if(prefs.containsKey('day')){
      this.day=prefs.getInt('day');
    }
    else{
      this.day=0;
    }
    if(prefs.containsKey('colors')){
      this.colors=prefs.getStringList('colors');
    }
    else{
      this.colors=new List<String>();
    }
    if(prefs.containsKey('skips')){
      this.skips=prefs.getInt('skips');
    }
    else{
      this.skips=0;
    }
    if(prefs.containsKey('coinMap')){
      this.coinMap=prefs.getString('coinMap');
    }
    else{
      this.coinMap='000000000';
    }
    if(prefs.containsKey('gems')){
      this.gems=prefs.getInt(('gems'));
    }
    else{
      this.gems=0;
    }
  }

  void write(){
    prefs.setInt('stars', this.stars);
    prefs.setInt('coins',this.coins);
    prefs.setStringList('levelstr', this.levelStr);
    var now=DateTime.now();
    prefs.setString('lastLogin',now.toString());
    prefs.setInt('day',this.day);
    prefs.setStringList('colors',this.colors);
    prefs.setInt('skips', this.skips);
    prefs.setString('coinMap', this.coinMap);
  }
  void reset() async{
    this.stars=0;
    this.coins=0;
    this.levelStr=['04444'];
    this.day=0;
    this.skips=0;
    write();
  }
}