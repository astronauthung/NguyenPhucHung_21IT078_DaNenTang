import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  // Updated questions
  List<String> questions = [
    'The Earth revolves around the Sun.',
    'Humans can breathe underwater without equipment.',
    'The Eiffel Tower is in London.',
    'Water freezes at 0°C.',
    'Elephants are the largest land animals.',
    'Python is a snake and a programming language.',
    'Mars is known as the Red Planet.',
    'Fish can fly naturally.',
  ];

  int questionIndex = 0;

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (userPickedAnswer == true) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.lightGreenAccent,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.redAccent,
        ));
      }

      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        questionIndex = 0;
        scoreKeeper.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionIndex], // Updated question
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent, // Updated button color
                foregroundColor: Colors.black,   // Text color
                textStyle: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text('True'),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, // Updated button color
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text('False'),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
