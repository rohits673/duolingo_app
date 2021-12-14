import 'package:flutter/material.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  final String questions;

  Quiz({required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Questions(questions),
      ],
    );
  }
}
