import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import 'dart:developer';
import 'questionPage.dart';
import 'home.dart';
import 'data/questions.dart';

class Quiz extends StatefulWidget {
	const Quiz({super.key});

	@override
	State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

	 List<String> selectedAnswers = [];

	Widget? activeScreen;

	void chooseAnswer(String answer){
		
		selectedAnswers.add(answer);
		if(selectedAnswers.length == questions.length){
			setState((){
				activeScreen =  Result(selectedAnswers, restart);
				selectedAnswers = [];
				});
		}
		log(selectedAnswers.toString());
	}

	void restart(){
		setState(() {
			selectedAnswers = [];
			activeScreen = Home(switchScreen);
		});
	}

	@override
	  void initState() {
	    super.initState();
	    activeScreen = Home(switchScreen);
	  }

	void switchScreen (){
		setState(() {
			activeScreen = Questions(chooseAnswer);
			});
	}
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Container(
					decoration: const BoxDecoration(
						gradient: LinearGradient(
							colors: [
							Colors.deepPurpleAccent,
							Colors.purple
							])
						),
					child: activeScreen,
					), 
				),
			);
	}
}