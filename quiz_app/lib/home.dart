import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, { super.key});

  final void Function() switchScreen; 

  @override
  Widget build(BuildContext context) {
    return Center(
    	child: Column(
    		mainAxisAlignment: MainAxisAlignment.center,
    		children: [
    		Image.asset(
    			'assets/images/quiz-logo.png',
    			width: 300,
    			color: Colors.white.withOpacity(.8),
    			),
    		const SizedBox(height: 30,),
    		Text(
    			"Learn Flutter !", 
    			style: TextStyle(
    				fontSize: 30, 
    				color: Colors.white.withOpacity(.8)
    				),
    			),
    		const SizedBox(height: 30,),
    		OutlinedButton.icon(
    			onPressed: switchScreen, 
    			label: const Text("Start Quiz"),  
    			icon: const Icon(Icons.arrow_right_alt_outlined),
    			style: OutlinedButton.styleFrom(
    				foregroundColor: Colors.white.withOpacity(.8),
    				),
    			),
    		],
    		),
    	);
  }
}