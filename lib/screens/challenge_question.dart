import 'package:PizzaRush/screens/performace.dart';
import 'package:PizzaRush/screens/performace_challenger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeQuestion extends StatefulWidget {
  @override
  _ChallengeQuestionState createState() => _ChallengeQuestionState();
}

class _ChallengeQuestionState extends State<ChallengeQuestion> {
  bool pressAttention = false;
  bool pressAttention1 = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;


  bool pressAttention4 = false;
  bool pressAttention5 = false;
  bool pressAttention6 = false;
  bool pressAttention7 = false;

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
                  Text(' Solve Questions',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 3,maxLines: 2,)]),
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
                                  Flexible(
                                  child: Text('Q: You have to make a pizza with d=28cm! What is the total area of the pizza?',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4, maxLines: 8,),

                                  )]),
                            SizedBox(height: 25),



                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RaisedButton(
                                    color: pressAttention ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention = !pressAttention),
                                    child: Text(""
                                        "A) 615 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),
                            SizedBox(height: 5),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RaisedButton(
                                    color: pressAttention1 ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention1 = !pressAttention1),
                                    child: Text(""
                                        "B) 234 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),

                            SizedBox(height: 5),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RaisedButton(
                                    color: pressAttention2 ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention2 = !pressAttention2),
                                    highlightColor: Colors.purpleAccent[200],
                                    child: Text(""
                                        "C) 329 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),

                            SizedBox(height: 5),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RaisedButton(
                                    color: pressAttention3 ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention3 = !pressAttention3),

                                    child: Text(""
                                        "D) 807 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),


                          ],
                        ),
                      ),


                      SizedBox(height: 25),


                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(

                                children: <Widget>[
                                  Flexible(
                                    child: Text('Q: You have to make a pizza with d=28cm! What is the total area of the pizza?',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4, maxLines: 8,),

                                  )]),
                            SizedBox(height: 25),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RaisedButton(
                                    color: pressAttention4 ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention4 = !pressAttention4),
                                    child: Text(""
                                        "A) 615 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),
                            SizedBox(height: 5),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RaisedButton(
                                    color: pressAttention5 ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention5 = !pressAttention5),
                                    child: Text(""
                                        "B) 234 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),

                            SizedBox(height: 5),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RaisedButton(
                                    color: pressAttention6 ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention6 = !pressAttention6),
                                    child: Text(""
                                        "C) 329 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),

                            SizedBox(height: 5),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RaisedButton(
                                    color: pressAttention7 ? Colors.red[200] : Colors.grey[200],
                                    onPressed: () => setState(() => pressAttention7 = !pressAttention7),
                                    child: Text(""
                                        "D) 807 cm^2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                                  )
                                ]),


                          ],
                        ),
                      ),



                      SizedBox(height: 35),





                    ]
                )
            ),


            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(width: 25,),
                  Expanded(child:
                  RaisedButton(
                    color: Colors.grey[200],
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => PerformanceChallenger()));
                    },

                    child: Text(
                        "Challenge",style: TextStyle(fontSize: 40,color: Colors.red[200])),
                  )),
                  SizedBox(width: 25,),
                ]),

          ],
        ));}}





