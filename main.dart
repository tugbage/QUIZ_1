import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:flutterquizim_app/quizPage.dart';

void main (){
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.portraitUp]);
  runApp(new MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return new MaterialApp(
   theme: ThemeData.dark(),

   debugShowCheckedModeBanner: false,
   home: new HomePage(),

 );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => new _HomePageState() ;
}

class  _HomePageState extends State<HomePage>{
  @override
  void initState() {
  super.initState() ;
  Timer(Duration(seconds: 5), ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context ) => new QuizPage())));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZ APPLICATION'),
        leading: Icon(Icons.question_answer),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            radius: 80.0,
            backgroundImage:
            NetworkImage('https://previews.123rf.com/images/blankstock/blankstock1606/blankstock160603746/59017239-quiz-sign-icon-questions-and-answers-game-flat-quiz-icon-simple-design-quiz-symbol-quiz-graphic-elem.jpg'),
            backgroundColor: Colors.transparent,
          ),
      Padding(
        padding: EdgeInsets.only(top: 30.0,),
      ),
       

       new Text ("QUIZE HOŞGELDİN!",  style: TextStyle(color: Colors.yellow, fontSize: 25.0,),
       ),

        ],
      ),
    );
  }
}
