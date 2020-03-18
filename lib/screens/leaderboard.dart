import 'package:flutter/material.dart';
import 'leaderboardData.dart'; 

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    
      return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: new Container(),
            title: Text('LEADERBOARD'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
            bottom: TabBar(
              indicatorColor: Colors.green[800],
              tabs: [
                Tab(text: 'Algebra',),
                Tab(text: 'Trigonometry',),
                Tab(text: 'Geometry',),
              ],
            ),
          ),

          body: TabBarView(
            children: [
              Algebra(),
              Geometry(),
              Trigonometry(),
            ],
          ),
        ),
    );
  }
}

