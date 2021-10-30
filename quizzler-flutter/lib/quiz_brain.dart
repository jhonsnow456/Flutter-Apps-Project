import 'question.dart';

class QuizBrain{
  int _questionNumber = 0;

  List <Question>_questionBank = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false
    ),
    Question(
        questionText: 'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true
    ),
    Question(
        questionText: 'A slug\'s blood is green.',
        questionAnswer: true
    ),
    Question(
        questionText: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        questionAnswer: true
    ),
    Question(
        questionText: 'It is illegal to pee in the Ocean in Portugal.',
        questionAnswer: true
    ),
    Question(
        questionText: 'No piece of square dry paper can be folded in half more than 7 times.',
        questionAnswer: false
    ),
    Question(
        questionText: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        questionAnswer: true
    ),
    Question(
        questionText: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questionAnswer: false
    ),
    Question(
        questionText: 'The total surface area of two human lungs is approximately 70 square metres.',
        questionAnswer: true
    ),
    Question(
        questionText: 'Google was originally called \"Backrub\".',
        questionAnswer: true
    ),
    Question(
        questionText: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questionAnswer: true
    ),
    Question(
        questionText: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questionAnswer: true
    )
  ];

  void nextQuestion(){
    if (_questionNumber < _questionBank.length - 1){
      _questionNumber++;
    }
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}