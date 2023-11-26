import 'package:flutter/material.dart';
import 'package:quiz_app/summary.dart';
import 'data/questions.dart';

class Result extends StatelessWidget{
  const Result(
        this.selectedAnswers,
        this.restart, {
        super.key}
      );

  final void Function() restart;
  final List<String> selectedAnswers;

  get _summaryData{
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < selectedAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }


  @override
  Widget build(BuildContext context){
    int numOfCorrectAnswer = _summaryData
        .where( (element) => element['user_answer'] == element['correct_answer'] )
        .length;

    return Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numOfCorrectAnswer out of ${questions.length} questions correctly ',
              style: const TextStyle( color: Colors.white, ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 31),

            Summary(_summaryData),

            const SizedBox(height: 33),

            TextButton.icon(
              onPressed: restart,
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.blue)
              ),
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Color.fromARGB(255, 250, 205, 254),
              ),
              label: const Text(
                "restart Quiz!",
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 205, 254),
                ),
              ),
            )
          ],
        ) //
    );
  }
}