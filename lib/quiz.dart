import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizScreen extends StatefulWidget{
  static const String id = 'quiz_screen';
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
/*
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState(){
    super.initState();

    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser);
      }
    }
    catch (e) {
      print(e);
    }
  }
*/
/*
  void getQuiz() async{
    //final quizQuestion await _firestore
  }
 */
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