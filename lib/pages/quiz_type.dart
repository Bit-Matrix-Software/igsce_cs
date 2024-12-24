import 'package:flutter/material.dart';

class QuizType1Page extends StatelessWidget {
  const QuizType1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Type 1'),
      ),
      body: Center(
        child: Text('Quiz Type 1 Page'),
      ),
    );
  }
}

class QuizType2Page extends StatelessWidget {
  const QuizType2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Type 2'),
      ),
      body: Center(
        child: Text('Quiz Type 2 Page'),
      ),
    );
  }
}