import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
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
              Text("Here's the scoreboard",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ]
        ),
      ),
    );
  }
}