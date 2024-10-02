import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 128, 211),
        appBar: AppBar(
          title: const Center(
            child: Text('DiceApp'),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 128, 211),
        ),
        body: const DicePage(),
      ),
    )
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void dicee() {
    setState (
      () {
        rightDiceNumber = Random().nextInt(6) + 1;
        leftDiceNumber = Random().nextInt(6) + 1;
      },
    );
  }

  @override
  Widget build (BuildContext context) {
    return Center(
      child: Row (
        children: <Widget>[
          Expanded(
            child: TextButton (
              onPressed: () {
                dicee();
              },
              child: Image.asset('images/dice$leftDiceNumber.png')
            ),
          ),
          Expanded(
            child: TextButton (
              onPressed: () {
                dicee();
              },
              child: Image.asset('images/dice$rightDiceNumber.png')
            ),
          ),
        ],
      )
    );
  }
}