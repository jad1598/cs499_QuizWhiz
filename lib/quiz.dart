import 'package:flutter/material.dart';
import 'package:quiz_whiz/chooseQuiz.dart';
import 'package:quiz_whiz/scoreBoard.dart';
import 'homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quizData.dart';
import  'chooseQuiz.dart';

QuizBrain quizBrain = QuizBrain();

var count = 0;
var ct;
/*
  Description: setCount and getCount are setters and getters used to keep track of the
  number of questions gotten correct.
 */
void setCount(count){ ct=count;}
int getCount(){ return ct;}


class QuizPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
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
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer(getType());
    setState(() {
      if(quizBrain.isFinished(getType()) != true)
      {
        if (userPickedAnswer == correctAnswer)
        {
          count++;
          print(count);
          scoreKeeper.add
            (Icon
            (
            Icons.check,
            color: Colors.blue,
          ));
        }
        else
        {
          scoreKeeper.add(Icon
            (
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion(getType());
      }
      if (quizBrain.isFinished(getType()) == true) {
        Navigator.push(
          context,
          MaterialPageRoute (
            builder: (context) {
              return ScoreBoard();
            },
          ),
        );
        setCount(count);
        quizBrain.reset();
        scoreKeeper = [];
        count = 0;
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
                quizBrain.getQuestionText(getType()),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
            children: scoreKeeper
        )
      ],
    );
  }
}

