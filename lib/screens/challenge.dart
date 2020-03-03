import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('View sent/recieved challenges and send challenges.'),
      ),
    );
  }
}