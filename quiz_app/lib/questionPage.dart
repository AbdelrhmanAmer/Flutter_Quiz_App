import 'package:flutter/material.dart';
import 'choice.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class Questions extends StatefulWidget {
  const Questions(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    setState(() {
      widget.onSelectedAnswer(answer);
      currentQuestionIndex++;
      });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
          currentQuestion.text,
          style: GoogleFonts.eduTasBeginner(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            ),
          textAlign: TextAlign.center,
          ),
        const SizedBox(height: 30,),
        // spread operator 
        ...currentQuestion.shuffledAnswers.map((e){
          return Container(
            margin: const EdgeInsets.all(8),
            child: Choice(
              choiceText: e ,
              onPressed: ()=>answerQuestion(e),
              ),
            );
          }),
        ],
        )
      );
  }
}