import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class getjson extends StatelessWidget{

  List questionData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/python.json'),
      builder: (context, snapshot){
        questionData = json.decode(snapshot.data.toString());
        if (questionData == null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        }
        // working page
        else{
          return QuizPage(questionData : questionData);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget{

  var questionData;

  QuizPage({Key key, @required this.questionData}) : super(key: key);

  @override
  _QuizState createState() => _QuizState(questionData);
}

class _QuizState extends State<QuizPage> {

  var questionData;
  _QuizState(this.questionData);

  Widget choicebutton(){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: (){},
        child: Text(
          //questionData[1]["1"][k],
          "QUESTION 1",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        color: Colors.indigo,
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: (){
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "QuizWhiz"
              ),
              content: Text(
                "Going Back Is Not Allowed"
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                  ),
                )
              ],
            )
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  //"HARD CODED QUESTION",
                    questionData[0]["1"],
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton(),
                    choicebutton(),
                    choicebutton(),
                    choicebutton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





/*
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
}*/