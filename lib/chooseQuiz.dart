import 'package:flutter/material.dart';
import 'scoreBoard.dart';
import 'quiz.dart';
var chr;
void setType(String type)
{
  chr = type;
}
String getType()
{
  return chr;
}
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
              child: Text('Computer Science Quiz'),
              onPressed: () {
                setType('C');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPages()),
                );
              }),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('History Quiz'),
              onPressed: () {
                setType('H');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPages()),
                );
              }),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Engineering Quiz'),
              onPressed: () {
                setType('E');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPages()),
                );
              }),
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
