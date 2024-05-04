import 'package:flutter/material.dart';
import 'package:operator_forvia/models/questions.dart';
import 'package:operator_forvia/screens/quiz_screen.dart';
import 'package:operator_forvia/widgets/next_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 40), // Doubled the padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Score:',
                style: TextStyle(
                  fontSize: 48, // Doubled the font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40), // Doubled the SizedBox height
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 300, // Doubled the height
                    width: 300, // Doubled the width
                    child: CircularProgressIndicator(
                      strokeWidth: 20, // Doubled the strokeWidth
                      value: score / 9,
                      color: Colors.green,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        score.toString(),
                        style: const TextStyle(
                            fontSize: 80), // Doubled the font size
                      ),
                      const SizedBox(height: 20), // Doubled the SizedBox height
                      Text(
                        '${(score / questions.length * 100).round()}%',
                        style: const TextStyle(
                            fontSize: 36), // Doubled the font size
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60), // Doubled the SizedBox height
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Return to the previous screen
                },
                child: Text('Return to Dashboard',
                    style: TextStyle(fontSize: 24)), // Doubled the font size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
