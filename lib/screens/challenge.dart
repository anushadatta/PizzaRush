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
  String _topicValue;
  String _difficultyValue;
  String _challengerValue;

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
                  Container(
                    width: 392.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: DropdownButton<String>(
                      hint: Text('Topic'),
                      style: TextStyle(
                        color: Colors.green[800],fontSize: 25,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _topicValue = value;
                        });
                      },
                      value: _topicValue,
                      elevation: 16,
                      items: <String>['Algebra', 'Geometry','Trigonometry']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toLowerCase(),
                          child: Text(value, textAlign: TextAlign.center),
                        );
                      })
                          .toList(),
                      underline: Container(
                        height: 2,
                        color: Colors.green[600],
                      ),
                    ),
                  )
                ]
            ),

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
                  Container(
                    width: 392.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: DropdownButton<String>(
                      hint: Text('Difficulty'),
                      style: TextStyle(
                        color: Colors.green[800],fontSize: 25,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _difficultyValue = value;
                        });
                      },
                      value: _difficultyValue,
                      elevation: 16,
                      items: <String>['Easy', 'Medium', 'Hard']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toLowerCase(),
                          child: Text(value, textAlign: TextAlign.center),
                        );
                      })
                          .toList(),
                      underline: Container(
                        height: 2,
                        color: Colors.green[600],
                      ),
                    ),
                  )
                ]
            ),

            SizedBox(height: 25),

            Center(child: Text('User to Challenge',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    width: 230.0,
                    height: 60.0,
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green[800], width: 2.0)
                          ),
                          focusedBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green[800], width: 2.0)
                          ),
                          hintText: 'User ID',
                      ),
                      onChanged: (val) {
                        setState(() => _challengerValue = val);
                      },
                    ),
                  ),
                ]
              ),
              underline: Container(
                height: 4,
                width: 12,

                  Center(
                        child: RaisedButton(
                          color: Colors.white70,
                          onPressed: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => ChallengeQuestion(topic: _topicValue, level: _difficultyValue, challengee: _challengerValue,)));
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
          ]
      );
    }
  );
  void initState() {
    super.initState();
    setState(()  {
    });
  }

}