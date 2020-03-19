import 'package:flutter/material.dart';

import'package:PizzaRush/models/challenges.dart'; 

class SentChallengesCard extends StatefulWidget {
  
  Challenges c;
  SentChallengesCard({this.c});
  
  @override
  _SentChallengesCardState createState() => _SentChallengesCardState();
}

class _SentChallengesCardState extends State<SentChallengesCard> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}