import 'package:flutter/material.dart';
import 'homePage.dart';

class QuizCS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topic: Computer Science"),
      ),
      body: Center(
        child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Which of the following is proper syntax for python?',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('print(hello);'),
                  onPressed: () {}
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('printf(Hello)'),
                  onPressed: () {}
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('print(\'hello\')'),
                  onPressed: () {}
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomePage();
                  },
                  ),
                  );
                },
                child: Text(
                  "Go back",
                ),
              )
            ]
        ),
      ),
    );
  }
}