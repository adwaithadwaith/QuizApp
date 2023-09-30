import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';
// import 'package:quizapp/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.refreshQuiz});

  final List<String> chosenAnswers;
  final void Function() refreshQuiz;
  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'selected_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

// set the current screen to new quiz.
  void restart() {}

  @override
  Widget build(context) {
    final summaryData = getSummeryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['selected_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(206, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: refreshQuiz,
                icon: const Icon(Icons.refresh),
                label: const Text('Restart the quiz!'))
          ],
        ),
      ),
    );
  }
}
