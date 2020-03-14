import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'challenge.dart';

class PerformanceChallenger extends StatefulWidget {
  @override
  _PerformanceChallengerState createState() => _PerformanceChallengerState();
}

class _PerformanceChallengerState extends State<PerformanceChallenger> {
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
                  Text('Performance Results',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 3,maxLines: 2,)]),
            SizedBox(height: 40),

            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[


                  SizedBox(height: 70),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        Icon(Icons.timer),
                        Text('Your Time',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                        Text('50s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                      ]),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.score),
                        Text('Your Score',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                        Text('230',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                      ]),
                  SizedBox(height: 25),

                ],
              ),
            ),
            SizedBox(height: 50),

            Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: (){},
                        child: Text(
                            'Challenge',
                            style: TextStyle(fontSize: 20)
                        ),
                      ),
                    ])),
            SizedBox(height: 25),

            Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => Challenge()));
                        },
                        child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 20)
                        ),
                      ),
                    ]))
          ]),



    );}}





