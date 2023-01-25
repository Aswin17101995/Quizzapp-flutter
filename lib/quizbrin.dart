import 'question.dart';

class QuizBrain{
  int _qNumber = 0;
  List<Question> _Qbank =[
    Question(q:  'You can lead a cow down stairs but not up stairs.', a: true),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: false),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\."', a: false),
    Question(q:  'You can lead a cow down stairs but not up stairs.', a: true),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: false),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\."', a: false),
    Question(q:  'You can lead a cow down stairs but not up stairs.', a: true),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: false),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\."', a: false),
    Question(q:  'You can lead a cow down stairs but not up stairs.', a: true),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: false),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\."', a: false)
  ];
  void getNextQuestion(){
    if(_qNumber <= _Qbank.length -1)
      {
        _qNumber ++;
      }
  }
  String getQuestion (){
    return _Qbank[_qNumber].q_text;
  }

  bool getAnswer(){
    return _Qbank[_qNumber].answer;
  }
  int getLenght(){
    return _Qbank.length;
  }
  bool isQuizover(){
    if(_qNumber == _Qbank.length)
      {
        return true;
      }
    else
      {
        return false;
      }
  }
  void restartQuiz(){
    _qNumber = 0;
  }
  int getQnumber(){
    return _qNumber;
  }
}