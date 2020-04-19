import 'package:PizzaRush/models/question.dart';
import 'package:PizzaRush/screens/performace.dart';
import 'package:PizzaRush/screens/performace_challenger.dart';
import 'package:PizzaRush/screens/user_account.dart';
import 'package:PizzaRush/services/collections.dart';
import 'package:flutter/cupertino.dart';
import 'user_account.dart';
import 'package:PizzaRush/models/question.dart';
import 'package:PizzaRush/services/collections.dart';
import 'package:flushbar/flushbar.dart';
import 'package:PizzaRush/screens/resultscreen.dart';

import 'dart:math';

class ChallengeQuestion extends StatefulWidget {
  final topic;
  final level;
  final challengee;

  ChallengeQuestion({@required this.topicchosen, @required this.level, @required this.challengee});
  @override
  _ChallengeQuestionState createState() => _ChallengeQuestionState();
}


class _ChallengeQuestionState extends State<ChallengeQuestion> {

  Future<List> questions;
  String _q1ans;
  String _q2ans;
  String _cans1;
  String _cans2;
  int _points;
  Stopwatch watch = new Stopwatch();

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
                Navigator.push(context, CupertinoPageRoute(builder: (context) => UserAccount()));
              },
            )
          ],
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

        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Text('Solve Questions',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)
                ),
                buildQuestionList(questions),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(width: 25,),
                        Expanded(child:
                        RaisedButton(
                          color: Colors.grey[200],
                          onPressed: (){
                            setState(() {
                              _points = 0;
                            });
                            watch.stop();
                            calculatePoints();
                            print(_points);
                            print(watch.elapsedMilliseconds);
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => PerformanceChallenger(points: _points, time: watch.elapsedMilliseconds)));
                          },

                          child: Text(
                              "CHALLENGE",style: TextStyle(fontSize: 35,color: Colors.green[700])),
                        )),
                        SizedBox(width: 25,),

                      ]
                  ),
                ),
              ],
            ),
          ]
        )
      );
  }

  Widget buildQuestionList(apiData) => FutureBuilder(
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
        else if (snapshot.data.length == 0) {
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
        else {
          _cans1 = snapshot.data[0].correctanswer;
          _cans2 = snapshot.data[1].correctanswer;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  leading: Text('Q1',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  title: Text('${snapshot.data[0].question}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      )
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('${snapshot.data[0].answer1}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[0].answer1}',
                          groupValue: _q1ans,
                          onChanged: (String value) {
                            setState(() {
                              _q1ans = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('${snapshot.data[0].answer2}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[0].answer2}',
                          groupValue: _q1ans,
                          onChanged: (String value) {
                            setState(() {
                              _q1ans = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('${snapshot.data[0].answer3}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[0].answer3}',
                          groupValue: _q1ans,
                          onChanged: (String value) {
                            setState(() {
                              _q1ans = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('${snapshot.data[0].answer4}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[0].answer4}',
                          groupValue: _q1ans,
                          onChanged: (String value) {
                            setState(() {
                              _q1ans = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  leading: Text('Q2',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  title: Text('${snapshot.data[1].question}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      )
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('${snapshot.data[1].answer1}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[1].answer1}',
                          groupValue: _q2ans,
                          onChanged: (String value) {
                            setState(() {
                              _q2ans = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('${snapshot.data[1].answer2}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[1].answer2}',
                          groupValue: _q2ans,
                          onChanged: (String value) {
                            setState(() {
                              _q2ans = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('${snapshot.data[1].answer3}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[1].answer3}',
                          groupValue: _q2ans,
                          onChanged: (String value) {
                            setState(() {
                              _q2ans = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('${snapshot.data[1].answer4}'),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: '${snapshot.data[1].answer4}',
                          groupValue: _q2ans,
                          onChanged: (String value) {
                            setState(() {
                              _q2ans = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }
      );

  void calculatePoints() {
    if(_q1ans == _cans1) {
      setState(() {
        _points += 100;
      });
    }
    if(_q2ans == _cans2)
    {
      setState(() {
        _points += 100;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questions = Collections().getChallengeQuestions(widget.level, widget.topic);
    watch.reset();
    watch.start();
  }
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

  void decrementSize(){
    setState(() {
      index-=1;
    });
  }

  void incrementSize(){
    setState(() {
      index+=1;
    });
  }


}