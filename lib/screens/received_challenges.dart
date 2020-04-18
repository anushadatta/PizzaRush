import 'package:flutter/material.dart';
import 'package:PizzaRush/services/collections.dart';

class ReceivedChallenge extends StatefulWidget {
  @override
  _ReceivedChallengeState createState() => _ReceivedChallengeState();
}

class _ReceivedChallengeState extends State<ReceivedChallenge> {
  int numChallenges;
  Future<List> challengesList;

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
              Text('Received Challenges',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),textScaleFactor: 3,maxLines: 2,)]),
        SizedBox(height: 40),
        Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height:300,
            child:ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                 buildChallengesList(challengesList)
                ]
            )
        )],
    ));
  }

  Widget buildChallengesList(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green)),
                  ),
                ),
              ],
            )
        );
        if (snapshot.data.length == 0) {
          return Container(
              height: 300,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      child: Text("No Challenges Here!", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                        textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              )
          );
        }
        numChallenges = snapshot.data.length;

        return new SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for(int i = 0; i < snapshot.data.length; i++)

                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(

                              children: <Widget>[
                                SizedBox(width: 20,),
                                Icon(Icons.timer),
                                SizedBox(width: 30,),
                                Text('Time',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                                SizedBox(width: 75,),
                                Text('${snapshot.data[i].challengersTime}s',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              ]),
                          SizedBox(height: 25),
                          Row(

                              children: <Widget>[
                                SizedBox(width: 20,),
                                Icon(Icons.score),
                                SizedBox(width: 30,),
                                Text('Score',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                                SizedBox(width: 69,),
                                Text('${snapshot.data[i].challengersScore}',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              ]),
                          SizedBox(height: 25),
                          Row(

                              children: <Widget>[
                                SizedBox(width: 20,),

                                Icon(Icons.subject),
                                SizedBox(width: 30,),
                                Text('Topic',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                                SizedBox(width: 74,),
                                Text('${snapshot.data[i].topic}',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              ]),
                          SizedBox(height: 25),
                          Row(

                              children: <Widget>[
                                SizedBox(width: 20,),
                                Icon(Icons.sort),
                                SizedBox(width: 30,),
                                Text('Difficulty',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                                SizedBox(width: 43,),
                                Text('${snapshot.data[i].level}',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                              ]),
                          SizedBox(height: 25),
                          Row(

                              children: <Widget>[
                                SizedBox(width: 20,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 30,),
                                Text('Challenger',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.4,),
                                SizedBox(width: 27,),
                                Text('${snapshot.data[i].challenger}',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1,),
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
                ])


        );
      });

  void initState() {
    super.initState();
    setState(()  {
      challengesList = Collections().getChallenges();
    });
  }


}





