import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'scoreBoard.dart';
import 'chooseQuiz.dart';

class HomePage extends StatelessWidget {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      print(error);
    }
  }

  static String id = "home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home"),
        actions: <Widget>[
          FlatButton(
              child: Text('Logout',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
                signOut();
              }),
        ],
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
              padding: const EdgeInsets.all(50),
              child: Text('Choose a Quiz', style: TextStyle(fontSize: 30.0)),
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
