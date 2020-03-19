import 'package:PizzaRush/models/challenges.dart';
import 'package:PizzaRush/screens/challenge.dart';
import 'package:flutter/material.dart';

import 'sent_challenges_card.dart';

class SentChallenge extends StatefulWidget {
  @override
  _SentChallengeState createState() => _SentChallengeState();
}

class _SentChallengeState extends State<SentChallenge> {

  List<Challenges> challengeList = 
  [
    Challenges(
      id: '1',
      questions: [1,2,3],
      topic: 'algebra',
      level: 'easy',
      outcome: 'LOST',
      challenger: 'mehul.kumar171@gmail.com',
      challengee: 'palakasomani@gmail.com', 
      challengeeScore: 10,
      challengeeTime: 10,
      challengersScore: 10,
      challengersTime: 10,
    ), 

    Challenges(
      id: '1',
      questions: [1,2,3],
      topic: 'algebra',
      level: 'easy',
      outcome: 'WON',
      challenger: 'mehul.kumar171@gmail.com',
      challengee: 'palakasomani@gmail.com', 
      challengeeScore: 10,
      challengeeTime: 10,
      challengersScore: 10,
      challengersTime: 10,
    ), 

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Challenge'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),

      body: Column(
         children: <Widget> [

           SizedBox(height: 15.0), 

           Text("SENT CHALLENGES", 
           textAlign: TextAlign.center,
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0), 
           ), 
        
           Expanded(

              child: ListView.builder(
              scrollDirection: Axis.vertical, 

              itemBuilder: (context, index){
                
                return SentChallengesCard(c: challengeList[index]);
                
              },
              
              itemCount: challengeList.length,),
          ),
        ] 
      )
  );
}
}



