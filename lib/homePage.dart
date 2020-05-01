import 'package:flutter/material.dart';
import 'scoreBoard.dart';
import 'chooseQuiz.dart';

class HomePage extends StatelessWidget {

  static String id = "home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ListView(padding: EdgeInsets.all(15), children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Let's get Started!",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Choose a Quiz'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseQuiz()),
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
