import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_account.dart';
import 'package:PizzaRush/models/question.dart';
import 'package:PizzaRush/services/collections.dart';
import 'package:flushbar/flushbar.dart';
import 'package:PizzaRush/screens/resultscreen.dart';

import 'dart:math';

class QuestionScreen extends StatefulWidget {
  var topicchosen;
  var level;

  QuestionScreen({@required this.topicchosen, @required this.level});
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

enum SingingCharacter { alpha, beta, gamma, delta, epsilon, zeta, eta, theta}

class _QuestionScreenState extends State<QuestionScreen> {
  Future<List> questionList;
  int numassets = 1;
  String correctanswer;
  int points;
  int numQuestions;
  List<SingingCharacter> _character = [SingingCharacter.alpha, SingingCharacter.epsilon];
  List<SingingCharacter> _correctanswers = [];
  List<List<SingingCharacter>> _options = [[SingingCharacter.alpha, SingingCharacter.beta, SingingCharacter.gamma, SingingCharacter.delta], [SingingCharacter.epsilon, SingingCharacter.zeta, SingingCharacter.eta, SingingCharacter.theta]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Text('SOLVE QUESTIONS',
                      style: TextStyle(
                          fontSize: 26
                      ),)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                        width:30.0,
                        child: Image.asset('assets/PizzaRush.png'),
                      ),
                      Text('PizzaRush',
                        style: TextStyle(
                            fontSize: 10
                        ),),
                    ],
                  ),)

              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.green[800],


            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Should go to User Account page
                  // UserAccount()
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserAccount()),
                  );
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                buildQuestionList(questionList),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  0.0, 15.0, 0.0, 15.0),
              child:
                Container(
                  height: 50,
                    width: 150,
                    child: RaisedButton(
                      child: Text('SUBMIT'),
                      onPressed: (){
                         List<bool> correct = [];
                         for(int i=0; i<numQuestions; i++){
                           correct.add(false);
                           if(numassets.toString() == correctanswer){
                             setState(() {
                               points = points + pointsIncrement(widget.level);
                               Collections().updatePoints(widget.topicchosen, points);
                               Collections().updateQuestionDone(widget.topicchosen, widget.level);
                               correct[i]=true;
                             });
                           }
                         }

                           setState(() {
                             Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => ResultScreen(correct: correct, level: widget.level, topicchosen: widget.topicchosen)));
                           });

                      },
                    )
                ))
              ],
            ),
          )
        )
    );
  }

  Widget buildQuestionList(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData || points==null) return Container(
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

        int _numberCols = (numassets / 3).ceil();
        numQuestions = snapshot.data.length;
        correctanswer = snapshot.data[0].correctanswer;
        return new SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                          0.0, 15.0, 0.0, 0.0),
                      child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('SECTION',
                          style: TextStyle(
                            fontSize: 25
                          )),
                          new Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)
                            ),
                            child: Text("${widget.topicchosen.toString().toUpperCase()}",
                            style: TextStyle(
                              fontSize: 20
                            ),),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 50
                      ),
                      Column(
                        children: <Widget>[
                          Text('POINTS',
                              style: TextStyle(
                                  fontSize: 25
                              )),
                          new Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.fromLTRB(40, 3, 40, 3),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)
                            ),
                            child: Text("$points",
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          )
                        ],
                      ),

                    ],
                  )),

        Padding(
        padding: const EdgeInsets.fromLTRB(
        20.0, 15.0, 20.0, 0.0),
        child:
                      Text('Q: ${snapshot.data[0].question}', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                      ))),

                      Column(
                      children: <Widget>[
                      ListView.builder(
                      itemBuilder: (_, index) {
                      return Container(
                      height: 120,
                      child: Center(
                      child: ListView.builder(
                      itemBuilder: (i , _) {
                      return  Container(
                        width: 100,
                        height: 0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(snapshot.data[0].imageUrl),
                          ),
                        ),
                      );
                      },
                      itemCount: min(numassets - index * 3, 3),
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      ),
                      ),
                      );
                      },
                      itemCount: _numberCols,
                      shrinkWrap: true,
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: 80,
                      disabledColor: Colors.grey,
                      color: Colors.red,
                      onPressed: (numassets==0) ? null : decrementRoses,
                      ),
                      IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 80,
                      disabledColor: Colors.grey,
                      color: Colors.green,
                      onPressed: (numassets==12) ? null : incrementRoses,
                      ),
                      ],
                      ),
                        numassets>1 ? Text((numassets).toString()+' ${snapshot.data[0].storyContext}', style: TextStyle(fontSize: 24),) : numassets==1 ? Text((numassets).toString()+' ${snapshot.data[0].storyContext}', style: TextStyle(fontSize: 24)): Text('')
                      ],
                      ),
                                      Center(
                                        child: Container(
                                            height: 50,
                                            width: 100,
                                            child: RaisedButton(
                                              child: Text('HINT'),
                                              onPressed: (){
                                                Flushbar(
                                                  title: 'HINT',
                                                  message: '${snapshot.data[0].hint}',
                                                  icon: Icon(
                                                    Icons.info_outline,
                                                    size: 28,
                                                    color: Colors.green[900],
                                                  ),
                                                  leftBarIndicatorColor: Colors.green[900],
                                                  duration: Duration(seconds: 3),
                                                )..show(context);
                                                setState(() {
                                                  points = points - hintAvail(widget.level);
                                                  Collections().updatePoints(widget.topicchosen, points);
                                                });
                                              },
                                            )
                                        )
                                      )
                                    ]
                                )
                );});



  void initState() {
    super.initState();
    setState(()  {
      questionList = Collections().getQuestions(widget.level, widget.topicchosen);
      getPoints();
    });
  }

  int pointsIncrement(String level){
    if(level=='easy'){
      return 10;
    }
    else if(level=='medium'){
      return 20;
    }
    else if(level=='hard'){
      return 30;
    }
  }

  int hintAvail(String level){
    if(level=='easy'){
      return 30;
    }
    else if(level=='medium'){
      return 60;
    }
    else if(level=='hard'){
      return 90;
    }
  }

  void getPoints() async{
    points = await Collections().getScore(widget.topicchosen);
  }

  void decrementRoses(){
    setState(() {
      numassets-=1;
    });
  }

  void incrementRoses(){
    setState(() {
      numassets+=1;
    });
  }

}