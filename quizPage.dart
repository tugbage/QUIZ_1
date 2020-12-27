import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/quizsource.dart';
import 'screens/questions.dart';
import 'dart:async';
import 'package:flutterquizim_app/quizPage.dart';
import 'screens/quizsource.dart';


class QuizPage extends StatefulWidget{
  @override
  State createState() => new _QuizPageState();
}

class _QuizPageState extends  State<QuizPage>{
  _QuizPageState(){
    init();
    
  }
  Question  _currentQuestion;
QuestionList _quizQuestion = new QuestionList([
  new Question("Giriş kısmı çok uzun olduğu için kısaltılarak adını bir sendroma veren Big In Japan şarkısı hangi gruba aittir?", "B", "REM", "ALPHAVILLE", "THE CRANBERRIES" , "THE BEATLES"),
  new Question("Türkiye'nin kaç ülkeye sınırı vardır?", "D", "5", "6", "7" , "8"),


]);

int _questionNumber = 0;
int _score = 0;
bool _isCorrect;
bool overlayVisible;

void init(){
  _overlayVisible =false;
  _currentQuestion = _quizQuestion.nextQuestion;
  _questionNumber= _quizQuestion.questionNumber;


}

void choiceHandler(String choice){
  if(_questionNumber == _quizQuestion.length){
  }
  _isCorrect = (choice == _currentQuestion.correctChoice);
  _score = (_isCorrect) ? _score++ : _score;

  this.setState(() {_overlayVisible = true;});

}


Column createQuizQuestion(Question obj) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          new QuestionBox(Colors.red, "A", obj.secenekA, () (choiceHandler("A");)),
          new QuestionBox(Colors.blue, "B", obj.secenekB, () (choiceHandler("B");)),
        ],
      ),
      Row(
        children: <Widget>[
          new QuestionBox(Colors.green, "C", obj.secenekC, () (choiceHandler("C");)),
          new QuestionBox(Colors.deepOrangeAccent, "D", obj.secenekD, () (choiceHandler("D");)),
        ],
      ),
    ],
  );


}





  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget> [
        new Column(
          children: <Widget> [
            Center(
              child: Container(
                color: new Color(0x476879ff),
                width: double.infinity,
                padding: new EdgeInsets.all(5.0),
                child: Center(
                  child: Text("QUESTION 1", style: new TextStyle( color: Colors.amber, fontSize: 20.0, fontWeight: FontWeight.bold),),
                ),
              ),
            ),

            Center(
              child: new Container(
                  width: double.infinity,
                  decoration:  new BoxDecoration(color: Colors.black54),
                  padding: new EdgeInsets.only( top:10.0 , left:15.0,  right:15.0, bottom: 10.0),
                  child: new Center(child: Text("About question info..." , style: new  TextStyle(color: Colors.lime, fontSize: 25.0, fontWeight: FontWeight.bold),))

              ),
            ),
            Padding(
              padding:EdgeInsets.only(top:10.0,),
            ),
          ],
        )

      ],
    );
  }
}