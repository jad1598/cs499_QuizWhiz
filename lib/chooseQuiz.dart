import 'package:flutter/material.dart';
import 'scoreBoard.dart';
import 'quiz.dart';

class ChooseQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(padding: EdgeInsets.all(15), children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Choose A Quiz',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Quiz One'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              }),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Quiz Two'),
              onPressed: () {}),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Quiz Three'),
              onPressed: () {}),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ScoreBoard();
                  },
                ),
              );
            },
            child: Text(
              "Go To Scoreboard",
            ),
          )
        ]),
      ),
    );
  }
}
