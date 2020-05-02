import 'package:flutter/material.dart';
import 'package:quiz_whiz/chooseQuiz.dart';
import 'package:quiz_whiz/scoreBoard.dart';
import 'homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quizData.dart';
import 'chooseQuiz.dart';

QuizBrain quizBrain = QuizBrain();

var count = 0;
var ct;
/*
  Description: setCount and getCount are setters and getters used to keep track of the
  number of questions gotten correct.
 */
void setCount(count) {
  ct = count;
}

int getCount() {
  return ct;
}

class QuizPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  FirebaseUser loggedInUser;

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer(getType());
    setState(() {
      if (quizBrain.isFinished(getType()) != true) {
        if (userPickedAnswer == correctAnswer) {
          count++;
          print(count);
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.blue,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion(getType());
      }
      if (quizBrain.isFinished(getType()) == true) {

        getCurrentUser();
        updateUserData(count);

        Navigator.push(
          context,
          MaterialPageRoute(
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

  void getCurrentUser() async
  {
    try {
      final user = await _auth.currentUser();
      if (user != null)
        {
          loggedInUser = user;
        }
    }
    catch (e)
    {
      print(e);
    }
  }

  void updateUserData(int score)
  {
    var type = getType();
    var collection = _firestore.collection('users').document(loggedInUser.email);

    if (type == "C")
      {
        collection.updateData({'cs_quiz_score': count});
      }
    else if (type == "H")
      {
        collection.updateData({'history_quiz_score': count});
      }
    else if (type == "E")
      {
        collection.updateData({'engineering_quiz_score': count});
      }
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
        Row(children: scoreKeeper)
      ],
    );
  }
}
