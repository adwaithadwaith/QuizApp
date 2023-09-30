import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget {
  const QuestionIndex(
      {super.key, required this.index, required this.isCorrectAnswer});

  final int index;
  final bool isCorrectAnswer;

  @override
  Widget build(context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAnswer ? Colors.greenAccent : Colors.pinkAccent,
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        (index + 1).toString(),
        style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
      ),
    );
  }
}
