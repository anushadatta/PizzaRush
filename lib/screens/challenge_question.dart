import 'package:PizzaRush/screens/performace.dart';
import 'package:PizzaRush/screens/performace_challenger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeQuestion extends StatefulWidget {
  var topic;
  var level;
  var challengee; 

  ChallengeQuestion(
    {
      this.topic, 
      this.level,
      this.challengee
    }
  ); 

  @override 

  _ChallengeQuestionState createState() => _ChallengeQuestionState();

}

enum Answers{a,b,c,d} 

class _ChallengeQuestionState extends State<ChallengeQuestion> {
  Answers _character = Answers.a;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Challenge'),
          centerTitle: true,
          backgroundColor: Colors.green[700],

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

        body: ListView(

            scrollDirection: Axis.vertical,
            children: <Widget>[
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Text('Solve Questions',
                textAlign: TextAlign.center, 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)
                ),

              Text('Q: You have to make a pizza with d=28cm! What is the total area of the pizza?',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),

//              ListTile(
//                title: const Text('Lafayette'),
//                leading: Radio(
//                  value: Answers.a,
//                  groupValue: _character,
//                  onChanged: (SingingCharacter value) {
//                    setState(() { _character = value; });
//                  },
//                ),
//              ),
//              ListTile(
//                title: const Text('Thomas Jefferson'),
//                leading: Radio(
//                  value: SingingCharacter.jefferson,
//                  groupValue: _character,
//                  onChanged: (SingingCharacter value) {
//                    setState(() { _character = value; });
//                  },
//                ),
//              ),
//              ListTile(
//                title: const Text('Lafayette'),
//                leading: Radio(
//                  value: SingingCharacter.lafayette,
//                  groupValue: _character,
//                  onChanged: (SingingCharacter value) {
//                    setState(() { _character = value; });
//                  },
//                ),
//              ),
//              ListTile(
//                title: const Text('Lafayette'),
//                leading: Radio(
//                  value: SingingCharacter.lafayette,
//                  groupValue: _character,
//                  onChanged: (SingingCharacter value) {
//                    setState(() { _character = value; });
//                  },
//                ),
//              ),

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
                          "CHALLENGE",style: TextStyle(fontSize: 35,color: Colors.green[700])),
                    )),
                    SizedBox(width: 25,),
        
                  ]
                ),
            ],
          ),
        ])
      );
  }
}





