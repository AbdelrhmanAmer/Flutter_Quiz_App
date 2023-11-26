import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
	const Choice({required this.choiceText, required this.onPressed, super.key});

	final String choiceText;
	final void Function() onPressed;

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: onPressed, 
			style: ElevatedButton.styleFrom(
				foregroundColor: Colors.white,
				backgroundColor: Colors.deepPurple[900],
				padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(30)
					),
				),
			child: Text(choiceText, textAlign: TextAlign.center,),
		);
	}
}