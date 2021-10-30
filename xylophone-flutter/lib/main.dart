import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  var colorsList = [Colors.green, Colors.yellow, Colors.blue, Colors.purple, Colors.teal, Colors.red, Colors.blue];
  var songId = [1, 2, 3, 4, 5, 6, 7];

  void playSound(int key){
    final player = AudioCache();
    player.play('note$key.wav');
  }

  Expanded buildKey(var color, int song){
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
          ),
          onPressed: (){
            playSound(song);
          },
          child: Text('Click Me')
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(colorsList[0], songId[0]),
                buildKey(colorsList[1], songId[1]),
                buildKey(colorsList[2], songId[2]),
                buildKey(colorsList[3], songId[3]),
                buildKey(colorsList[4], songId[4]),
                buildKey(colorsList[5], songId[5]),
                buildKey(colorsList[6], songId[6]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}