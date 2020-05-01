import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBankC =
  [
    Question('Syntax does not matter in programming', false),
    Question('The hexadecimal number system contains digits from 1 - 15.', false),
    Question('MS Word is a hardware.', false),
    Question('Worms and trojan horses are easily detected and eliminated by antivirus software', true),
    Question('GNU / Linux is a open source operating system.', true),
    Question('Computer Science is the study of computer hardware.', true),
  ];

  List<Question> _questionBankH =
  [
    Question('The United States of America is also called America.', false),
    Question('The US is a diverse country with a multicultural society', true),
    Question('US is the 1st largest country in the world by land area and 3rd by population ', false),
    Question('July 4, 1776, the Declaration of Independence was issued ', true),
    Question('he estimated population of the US was 315,568,000 .', true),
    Question('The US has the world\'s largest economy.', true),
  ];

  void nextQuestion(String type)
  {
    if(type == "H")
    {
      if (_questionNumber < _questionBankC.length - 1)
      {
        _questionNumber++;
      }
    }
    else if(type == "C")
    {
      if (_questionNumber < _questionBankC.length - 1)
      {
        _questionNumber++;
      }
    }
  }

  String getQuestionText(String type)
  {
    if(type == 'C')
    {
      return _questionBankC[_questionNumber].questionText;
    }
    else if(type =='H')
    {
      return _questionBankH[_questionNumber].questionText;
    }
  }

  bool getCorrectAnswer(String type)
  {
    if(type == 'C')
    {
      return _questionBankC[_questionNumber].questionAnswer;
    }
    else if(type == 'H')
    {
      return _questionBankH[_questionNumber].questionAnswer;
    }
  }

  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished(String type)
  {
    if(type == 'C')
    {
      if (_questionNumber >= _questionBankC.length - 1)
      {
        print('Now returning true');
        return true;

      }
      else {
      return false;
      }
    }
    if(type == 'H')
    {
      if (_questionNumber >= _questionBankH.length - 1)
      {
        print('Now returning true');
        return true;

      }
      else {
        return false;
      }
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
