import 'package:flutter/material.dart';
import 'package:quizapp/question_index.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            //map returns iterable not list
            children: summaryData.map(
          (data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIndex(
                  index: data['question_index'] as int,
                  isCorrectAnswer:
                      data['selected_answer'] == data['correct_answer'],
                ),
                // Text(((data['question_index'] as int) + 1).toString()),
                //if we do not use expanded widget the text will not be broken into pieces to show in screen. it will show an error.
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'].toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['selected_answer'].toString(),
                            style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'].toString(),
                            style: const TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList() //used to convert the iterable to list,
            ),
      ),
    );
  }
}
