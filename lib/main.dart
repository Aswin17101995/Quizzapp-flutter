import 'package:flutter/material.dart';
import 'quizbrin.dart';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: const SafeArea(
        child: Quizz(),
      ),
    ),
  ),);
}

class Quizz extends StatefulWidget {
  const Quizz({Key? key}) : super(key: key);
  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  List <Widget> score = [];
  var index = 0 ;
  QuizBrain newQuiz = QuizBrain();
  var final_score = 0;
  @override
  Widget build(BuildContext context) {
    Icon check (type){
      if(type)
      {
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      }
      else
      {
        return const Icon(
          Icons.close,
          color: Colors.red,
        );
      }
    }
  void onPressed(var pressed,var ans){
      var correct = ans == pressed ? true : false;
      if(correct)
        {
          final_score ++;
          score.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        }
      else
        {
          score.add( Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

      newQuiz.getNextQuestion();
      // if(index < questions.length - 1)
      //   {
      //     index ++;
      //   }
      // else
      //   {
      //     index = 0;
      //   }
  }
    return Column(
      children: [
         if(!newQuiz.isQuizover())...[
         Expanded(flex: 5,child: Center(
          child: Text('${newQuiz.getQnumber() + 1} . ${newQuiz.getQuestion()}',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
        ),
        ),
        Expanded(
        flex: 1,
        child: TextButton(
          onPressed: (){
            setState(() {
              onPressed(true, newQuiz.getAnswer());
            });
            },
          child: Container(color: Colors.green,
          width: double.infinity,
          child: const Center(
          child: Text('Yes',style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          ),),
          ),
          ),
        ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: (){
              print('no');
              setState(() {
                onPressed(false,newQuiz.getAnswer());
              });
              },
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: const Center(
                child: Text('No',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: score,
            ),
          ),
        ),]
        else...[
          Center(
            child: Column(

              children: [
                Text("Quiz Over",style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),),
                Text('your Score is ',style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),),
                Text('$final_score',style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),),
                TextButton(onPressed: (){
                  setState(() {
                    index = 0;
                    final_score = 0;
                    score= [];
                    newQuiz.restartQuiz();
                  });
                }, child: Text(
                  'Restart',style: TextStyle(
                  fontSize: 22
                ),
                ))
              ],
            ),
          )
         ]

      ],
    );
  }
}

