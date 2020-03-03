import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('View Leaderboard for each math section.'),
      ),
    );
  }
}