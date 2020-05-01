import 'package:flutter/material.dart';
import 'quiz.dart';

var count = getCount();

class ScoreBoard extends StatelessWidget {
  static String id = "scoreboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoreboard"),
      ),
      body: Center(
        child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Choose Which Quiz's Score To See",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Quiz One: '+ count.toString()+ "/5"),
                  onPressed: () {
                    print(count);
                  }
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Quiz Two'),
                  onPressed: () {}
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Quiz Three'),
                  onPressed: () {}
              ),
            ]
        ),
      ),
    );
  }
}