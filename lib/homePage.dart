import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Choose Your Quiz',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('Quiz One'),
                onPressed: () {}
              ),
              FlatButton(
                onPressed: () {
                },
                child: Text(
                  "Go To Scoreboard",
                ),
              )
            ]
        ),
      ),
    );
  }
}