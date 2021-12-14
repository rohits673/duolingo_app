import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  // final void Function() restartQuiz;
  final int totalMarks;
  Result(this.resultScore, this.totalMarks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Your Score is $resultScore / $totalMarks",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
