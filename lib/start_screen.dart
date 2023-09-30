import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          scale: 2,
          color: const Color.fromARGB(171, 255, 255,
              255), // can use opacity but it require more performance
        ),
        const SizedBox(
          height: 70,
        ),
        Text(
          'Welcome to Quiz App',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 70,
        ),
        ElevatedButton.icon(
          onPressed: () {
            startQuiz();
          },
          icon: const Icon(Icons.arrow_circle_right),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 124, 189, 221)),
          label: const Text(
            'Press to start',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    ));
  }
}
