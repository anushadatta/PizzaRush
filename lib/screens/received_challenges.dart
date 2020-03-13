import 'package:flutter/material.dart';

class ReceivedChallenge extends StatefulWidget {
  @override
  _ReceivedChallengeState createState() => _ReceivedChallengeState();
}

class _ReceivedChallengeState extends State<ReceivedChallenge> {
  //String dropdownValue =;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Challenge'),
        centerTitle: true,
        backgroundColor: Colors.red[200],

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              // Should go to User Account page
              // UserAccount()

            },
          )
        ],
      ),

      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Received Challenges',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 3,maxLines: 2,)]),
        SizedBox(height: 40),
        Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height:300,
            child:ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.timer),
                              SizedBox(width: 75,),
                              Text('Time',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 75,),
                              Text('50s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.score),
                              SizedBox(width: 75,),
                              Text('Score',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 75,),
                              Text('230',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),

                              Icon(Icons.subject),
                              SizedBox(width: 75,),
                              Text('Topic',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 75,),
                              Text('Algebra',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.sort),
                              SizedBox(width: 70,),
                              Text('Difficulty',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 50,),
                              Text('Easy',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.account_circle),
                              SizedBox(width: 65,),
                              Text('Challenger',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 35,),
                              Text('Jules',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.6,),
                            ]),
                        SizedBox(height: 25),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Accept',textScaleFactor: 1.6,style: TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () { /* ... */ },
                            ),
                            FlatButton(
                              child: const Text('Decline',textScaleFactor: 1.6,style: TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () { /* ... */ },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),



                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.timer),
                              SizedBox(width: 75,),
                              Text('Time',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 75,),
                              Text('20s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.score),
                              SizedBox(width: 75,),
                              Text('Score',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 75,),
                              Text('200',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),

                              Icon(Icons.subject),
                              SizedBox(width: 75,),
                              Text('Topic',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 75,),
                              Text('Calculus',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.sort),
                              SizedBox(width: 70,),
                              Text('Difficulty',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 50,),
                              Text('Hard',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(

                            children: <Widget>[
                              SizedBox(width: 75,),
                              Icon(Icons.account_circle),
                              SizedBox(width: 65,),
                              Text('Challenger',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 35,),
                              Text('Sandy',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.6,),
                            ]),
                        SizedBox(height: 25),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Accept',textScaleFactor: 1.6,style: TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () { /* ... */ },
                            ),
                            FlatButton(
                              child: const Text('Decline',textScaleFactor: 1.6,style: TextStyle(fontWeight: FontWeight.bold)),
                              onPressed: () { /* ... */ },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),






                ]
            )
        )],
    ));}}





