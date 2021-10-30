import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    Dicee()
  );
}

class Dicee extends StatelessWidget {
  // const Dicee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 3, rightDiceNumber = 6;

  // Update Both the Dice on click on any of the dice..
  void updateBothDice(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: IconButton(
                onPressed: (){
                  setState(() {
                    updateBothDice();
                  });
                },
                icon: Image.asset('images/dice$leftDiceNumber.png'),
                iconSize: 150,
              )
          ),
          Expanded(
              child: IconButton(
                onPressed: (){
                  updateBothDice();
                },
                icon: Image.asset('images/dice$rightDiceNumber.png'),
                iconSize: 150,
              )
          ),
        ],
      ),
    );
  }
}
