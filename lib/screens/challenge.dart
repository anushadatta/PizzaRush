import 'package:PizzaRush/screens/challenge_question.dart';
import 'package:PizzaRush/screens/received_challenges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PizzaRush/screens/challenge_friend.dart';
import 'package:PizzaRush/screens/sent_challenges.dart';

class Challenge extends StatefulWidget {
  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  String dropdownValue1 = 'Algebra';
  String dropdownValue2 = 'Easy';
  String _value;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
      title: Text('CHALLENGE',
      style: TextStyle(fontSize: 35, color: Colors.black87, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.grey[50],
      elevation: 0.0,

      ),

    body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          
          SizedBox(height: 50),

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


          SizedBox(height: 40),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                
                Center(
                  child: SizedBox(
                  height: 60,
                  width: 230,
                  child:
                  RaisedButton(
                    color: Colors.white70,
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ChallengeQuestion()));
                    },

                    child: Text(
                        "CHALLENGE",style: TextStyle(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.bold)),
                  )
                ),
              ),
                
            ]
          )
        ]
      ),


        );}}



