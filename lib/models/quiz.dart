import 'package:flutter/material.dart';
import '../widgets/questions.dart';
import '../widgets/answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionIdx;
  final void Function(int) ansQuestion;

  Quiz(
      {required this.ansQuestion,
      required this.questions,
      required this.questionIdx});

// Questions(
//         questions[0]["set"][0]["items"][questionIdx]["q"],
//       ),
// ...(questions[questionIdx]["answers"] as List<Map<String, dynamic>>)
  //     .map((answer) {
  //   return Answer(() => ansQuestion(answer["score"]), answer["text"]);
  // }).toList(),

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Questions(
          questions[0]["set"][0]["items"][questionIdx]["q"],
        ),
        // Answers(
        //   questions[0]["set"][0]["items"][questionIdx]["i"],
        // )
      ],
    );
  }
}
