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
                  
                  Text(' Challenge sent to:',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                ]),
            Text(widget.c.challengee,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  Icon(Icons.timer),
                  
                  Text('Your Time: ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  
                  Text(widget.c.challengersTime.toString() + 's',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),
            SizedBox(height: 25),
            Row(
                children: <Widget>[
                  SizedBox(width: 65,),
                  Icon(Icons.score),
                  SizedBox(width: 65,),
                  Text('Your Score',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  SizedBox(width: 35,),
                  Text('230',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),
            SizedBox(height: 25),
            Row(
                children: <Widget>[
                  SizedBox(width: 65,),

                  Icon(Icons.subject),
                  SizedBox(width: 65,),
                  Text('Topic',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  SizedBox(width: 85,),
                  Text('Algebra',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),
            SizedBox(height: 25),
            Row(
                children: <Widget>[
                  SizedBox(width: 65,),
                  Icon(Icons.sort),
                  SizedBox(width: 65,),
                  Text('Difficulty',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                  SizedBox(width: 55,),
                  Text('Easy',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                ]),
            SizedBox(height: 35),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Accepted',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Time taken: 43s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Score: 106',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('You Won!',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                ]),
          ],
        ),
        SizedBox(height: 100)],
    )
      ),
    );
  }
}