/*
  Description: Question class is the template used for setting up questions in quizData.dart
 */
class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}

