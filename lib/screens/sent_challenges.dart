import 'package:flutter/material.dart';

class SentChallenge extends StatefulWidget {
  @override
  _SentChallengeState createState() => _SentChallengeState();
}

class _SentChallengeState extends State<SentChallenge> {
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

      body:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Sent Challenges',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 3,maxLines: 2,)]),
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
                              SizedBox(width: 65,),
                              Icon(Icons.account_circle),
                              SizedBox(width: 65,),
                              Text('Challenger',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 35,),
                              Text('Jules',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(


                            children: <Widget>[
                              SizedBox(width: 65,),
                              Icon(Icons.timer),
                              SizedBox(width: 65,),
                              Text('Your Time',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 45,),
                              Text('50s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
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
                  ),
                  SizedBox(height: 100),



                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(

                            children: <Widget>[
                              SizedBox(width: 65,),
                              Icon(Icons.account_circle),
                              SizedBox(width: 65,),
                              Text('Challenger',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 35,),
                              Text('Marie',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(


                            children: <Widget>[
                              SizedBox(width: 65,),
                              Icon(Icons.timer),
                              SizedBox(width: 65,),
                              Text('Your Time',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 45,),
                              Text('20s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
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
                              Text('Calculus',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                            ]),
                        SizedBox(height: 25),
                        Row(
                            children: <Widget>[
                              SizedBox(width: 65,),
                              Icon(Icons.sort),
                              SizedBox(width: 65,),
                              Text('Difficulty',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              SizedBox(width: 55,),
                              Text('Hard',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
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
                              Text('Time taken: 20s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Score: 306',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('You Lost!',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,)
                            ]),
                      ],
                    ),
                  ),






                  SizedBox(height: 50),






                ]
            )
        )],
    ));}}



