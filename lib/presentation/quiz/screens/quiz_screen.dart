import 'package:flutter/material.dart';
import 'package:residente_app/presentation/quiz/widgets/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: QuizBody(),
    );
  }
}
