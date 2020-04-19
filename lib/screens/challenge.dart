import 'package:PizzaRush/screens/challenge_question.dart';
import 'package:PizzaRush/screens/received_challenges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PizzaRush/screens/challenge_friend.dart';
import 'package:PizzaRush/screens/sent_challenges.dart';
import 'package:PizzaRush/services/collections.dart';

class Challenge extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  String dropdownValue1 = 'Algebra';
  String dropdownValue2 = 'Easy';
  String dropdownValue3 = 'palakasomani@gmail.com';

  Future<String> listOfClassmates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[

                SizedBox(height: 25),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 20),
                      Icon(Icons.assignment_turned_in, size: 40,),
                      SizedBox(width: 12),
                      SizedBox(
                        height:60,
                        width: 280,
                        child: RaisedButton(

                          color: Colors.grey[200],
                          onPressed: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => SentChallenge()));
                          },
                          child: Text(""
                              "Sent Challenges",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                        ),

                      ), SizedBox(width: 12),
                    ]),

                SizedBox(height: 15),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.call_received,size: 40,),

                      SizedBox(
                        height:60,
                        width: 280,

                        child: RaisedButton(
                          color: Colors.grey[200],
                          onPressed: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => ReceivedChallenge()));
                          },
                          child: Text(
                              "Received Challenges",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                        ),
                      )
                    ]),

                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Text('Select Math Topic',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),

                  ],
                ),



                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: <Widget>[
                      SizedBox(width: 150,),
                      DropdownButton<String>(
                        value: dropdownValue1,
                        icon: Icon(Icons.arrow_drop_down,size: 50),
                        iconSize: 30,
                        elevation: 26,
                        style: TextStyle(
                          color: Colors.green[800],fontSize: 25,
                        ),
                        underline: Container(
                          height: 4,
                          width: 12,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue1 = newValue;
                          });
                        },
                        items: <String>['Algebra', 'Geometry','Trigonometry']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, textAlign: TextAlign.center),
                          );
                        })
                            .toList(),

                      ),]),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Text('Select Difficulty',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),


                  ],
                ),



                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: <Widget>[
                      SizedBox(width: 160,),
                      DropdownButton<String>(
                        value: dropdownValue2,
                        icon: Icon(Icons.arrow_drop_down,size: 50),
                        iconSize: 30,
                        elevation: 26,
                        style: TextStyle(
                          color: Colors.green[800],fontSize: 25,
                        ),
                        underline: Container(
                          height: 4,
                          width: 12,

                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue2 = newValue;
                          });
                        },
                        items: <String>['Easy', 'Medium', 'Hard']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      ),]),

                SizedBox(height: 25),

                Center(child: Text('Select User to Challenge',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),



                SizedBox(height: 30),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Center(
                          child: RaisedButton(
                            color: Colors.white70,
                            onPressed: (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ChallengeQuestion(topicchosen: dropdownValue1, level: dropdownValue2, challengee: dropdownValue3,)));
                            },

                            child: Text(
                                "CHALLENGE",style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold)),
                          )
                      )
                    ]
                )
              ]
          )
      ),
    );
  }

  Widget buildFriendsList(apiData) => FutureBuilder(
    future: apiData,
    builder: (context, snapshot){
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
                    child: Text("No Questions Here!", style: TextStyle(
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




      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



            DropdownButton<String>(
              value: dropdownValue3,
              icon: Icon(Icons.arrow_drop_down,size: 50),
              iconSize: 30,
              elevation: 26,
              style: TextStyle(
                color: Colors.green[800],fontSize: 25,
              ),
              underline: Container(
                height: 4,
                width: 12,

              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue3 = newValue;
                });
              },

              // EXTRACT USERS TO CHALLENGE FROM FIREBASE
              items: snapshot.data
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
    ))]
      )
    )); }

  void initState() {
    super.initState();
    setState(()  {
    });
  }

}