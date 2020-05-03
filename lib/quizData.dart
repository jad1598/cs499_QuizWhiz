import 'question.dart';

class QuizData {
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
  List<Question> _questionBankE =
  [
    Question('220 million tons of technological hardware are trashed in the US each year.', true),
    Question('A diamond will dissolve in acid.', false),
    Question('The snowboard was invented by an engineer.', true),
    Question('A civil engineer created the slippery part of the water slide', true),
    Question('The Ferris Wheel is considered one of the greatest engineering wonders in the world ', true),
    Question('Engineers apply knowledge to solve practical problems, ', true),
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
    else if(type == "E")
    {
      if (_questionNumber < _questionBankE.length - 1)
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
    else if(type =='E')
    {
      return _questionBankE[_questionNumber].questionText;
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
    else if(type == 'E')
    {
      return _questionBankE[_questionNumber].questionAnswer;
    }
  }

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
    if(type == 'E')
    {
      if (_questionNumber >= _questionBankE.length - 1)
      {
        print('Now returning true');
        return true;

      }
      else {
        return false;
      }
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
