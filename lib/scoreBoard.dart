import 'package:flutter/material.dart';
import 'package:quiz_whiz/homePage.dart';
import 'quiz.dart';
import 'chooseQuiz.dart';
var count;
int countC, countH, countE;
class ScoreBoard extends StatelessWidget {
  static String id = "scoreboard";
  @override
  Widget build(BuildContext context) {
    count = getCount();

    if(getType() == 'C')
    {
      countC = count;
    }
    else if(getType() =='H')
    {
      countH = count;
    }
    else if(getType() =='E')
    {
      countE = count;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Scoreboard"),
      ),
      body: Center(
        child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Quiz Scores",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Computer Science: '+ countC.toString()+ "/5"),
                  onPressed: () {
                  }
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('History: '+ countH.toString()+ "/5"),
                  onPressed: () {}
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Engineering: '+ countE.toString()+ "/5"),
                  onPressed: () {}
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: Text(
                  "Go Home",
                ),
              )
            ]
        ),
      ),
    );
  }
}