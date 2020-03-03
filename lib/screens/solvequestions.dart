import 'package:flutter/material.dart';

class SolveQuestions extends StatefulWidget {
  @override
  _SolveQuestionsState createState() => _SolveQuestionsState();
}

class _SolveQuestionsState extends State<SolveQuestions> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Select math topic, level of difficulty and solve question'),
      ),
    );
  }
}