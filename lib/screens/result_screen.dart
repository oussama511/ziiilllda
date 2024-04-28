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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Score:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      value: score / 9,
                      color: Colors.green,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        score.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${(score / questions.length * 100).round()}%',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Return to the previous screen
                },
                child: Text('Return to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
