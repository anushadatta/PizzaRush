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
      margin: EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Column(
      
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        SizedBox(height: 25),

        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  
                  Icon(Icons.account_circle),
                  
                  Text(' CHALLENGE SENT TO:',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                ]),
           Text(widget.c.challengee,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Icon(Icons.subject),

                  Text(' TOPIC: ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                  Text(widget.c.topic,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Icon(Icons.sort),
                  
                  Text(' DIFFICULTY: ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                  Text(widget.c.level,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),
            
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Icon(Icons.timer),
                  
                  Text(' YOUR TIME: ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                  Text(widget.c.challengersTime.toString() + 's',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),
            
            SizedBox(height: 10),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Icon(Icons.score),
                  
                  Text(' YOUR SCORE: ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                  Text(widget.c.challengersScore.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Icon(Icons.timer),
                  
                  Text(' CHALLENGEE TIME: ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                  Text(widget.c.challengeeTime.toString() + 's',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),
            
            SizedBox(height: 10),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Icon(Icons.score),
                  
                  Text(' CHALLENGEE SCORE: ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                  Text(widget.c.challengeeScore.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),

            SizedBox(height: 25),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.c.outcome,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                ]),

            SizedBox(height: 20),
            ],
          ),
       ]
      )
      ),
    );
  }
}