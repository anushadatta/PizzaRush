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
  List<double> imageSize = [80, 100, 125, 150];
  String questiontype;
  int index = 0;
  int correctindex = 0;
  int numassets = 1;
  String correctanswerC;
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

                        if(questiontype == 'count'){
                         List<bool> correct = [];
                         for(int i=0; i<numQuestions; i++){
                           correct.add(false);
                           if(numassets.toString() == correctanswerC){
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
                           });}
                        if(questiontype == 'size'){
                          List<bool> correct = [];
                          for(int i=0; i<numQuestions; i++){
                            correct.add(false);
                            if(correctindex == index){
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
                        }

                        if(questiontype == 'mcq'){
                          List<bool> correct = [];
                          for(int i=0; i<numQuestions; i++){
                            correct.add(false);
                            if(_character[i] == _correctanswers[i]){
                              setState(() {
                                points = points + pointsIncrement(widget.level);
                                Collections().updatePoints(widget.topicchosen, points);
                                Collections().updateQuestionDone(widget.topicchosen, widget.level);
                                correct[i] = true;
                              });
                            }
                          }
                          setState(() {
                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => ResultScreen(correct: correct, level: widget.level, topicchosen: widget.topicchosen)));
                          });

                        }

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
        questiontype = snapshot.data[0].type;
        correctanswerC = snapshot.data[0].correctanswer;

        if(snapshot.data[0].type == 'count')
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
                );

        List answers = [snapshot.data[0].answer1, snapshot.data[0].answer2, snapshot.data[0].answer3, snapshot.data[0].answer4];
        String correctanswerS = snapshot.data[0].correctanswer;
        for(int i=0; i<answers.length; i++){
          if(correctanswerS == answers[i]){
            correctindex = i;
          }
        }

        if(snapshot.data[0].type == 'size')
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

        Padding(
        padding: const EdgeInsets.fromLTRB(
        20.0, 40.0, 20.0, 0.0),
        child:
                    Column(
                      children: <Widget>[
                        Container(
                          width: imageSize[index],
                          height: imageSize[index],
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(snapshot.data[0].imageUrl),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              iconSize: 80,
                              disabledColor: Colors.grey,
                              color: Colors.red,
                              onPressed: (index == 0) ? null : decrementSize,
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              iconSize: 80,
                              disabledColor: Colors.grey,
                              color: Colors.green,
                              onPressed: (index == 3) ? null : incrementSize,
                            ),
                          ],
                        ),
                        Text('${answers[index]}', style: TextStyle(fontSize: 24),)
                      ],
                    )),
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
          );

        if(snapshot.data[0].type == 'mcq'){
        for(int i = 0; i < snapshot.data.length; i++){
          if(snapshot.data[i].answer1 == snapshot.data[i].correctanswer){
            _correctanswers.add(_options[i][0]);
          }
          else if(snapshot.data[i].answer2 == snapshot.data[i].correctanswer){
            _correctanswers.add(_options[i][1]);
          }
          else if(snapshot.data[i].answer3 == snapshot.data[i].correctanswer){
            _correctanswers.add(_options[i][2]);
          }
          else if(snapshot.data[i].answer4 == snapshot.data[i].correctanswer){
            _correctanswers.add(_options[i][3]);
          }
        }}

        numQuestions = snapshot.data.length;

        if(snapshot.data[0].type == 'mcq')
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

                  for(int i = 0; i < snapshot.data.length; i++)

                    Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0.0, 15.0, 0.0, 0.0),
                        child:
                        Container(
                            height: MediaQuery.of(context).size.height * 1.35,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Card(
                                elevation: 10,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 1,
                                        height: MediaQuery.of(context).size.height * 0.8,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(snapshot.data[i].imageUrl),
                                          ),
                                        ),
                                      ),
                                      Text('Q: ${snapshot.data[i].question}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700
                                        ),
                                        textAlign: TextAlign.center,),

                                      ListTile(
                                        title: Text('A. ${snapshot.data[i].answer1}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                            )),
                                        leading: Radio(
                                          value: _options[i][0],
                                          groupValue: _character[i],
                                          onChanged: (SingingCharacter value) {
                                            setState(() { _character[i] = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('B. ${snapshot.data[i].answer2}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                            )),
                                        leading: Radio(
                                          value:_options[i][1],
                                          groupValue: _character[i],
                                          onChanged: (SingingCharacter value) {
                                            setState(() { _character[i] = value; });
                                          },
                                        ),
                                      ),

                                      ListTile(
                                        title: Text('C. ${snapshot.data[i].answer3}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                            )),
                                        leading: Radio(
                                          value: _options[i][2],
                                          groupValue: _character[i],
                                          onChanged: (SingingCharacter value) {
                                            setState(() { _character[i] = value; });
                                          },
                                        ),
                                      ),

                                      ListTile(
                                        title: Text('D. ${snapshot.data[i].answer4}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                            )),
                                        leading: Radio(
                                          value:_options[i][3],
                                          groupValue: _character[i],
                                          onChanged: (SingingCharacter value) {
                                            setState(() { _character[i] = value; });
                                          },
                                        ),
                                      ),
                                      Container(
                                          height: 50,
                                          width: 100,
                                          child: RaisedButton(
                                            child: Text('HINT'),
                                            onPressed: (){
                                              Flushbar(
                                                title: 'HINT',
                                                message: '${snapshot.data[i].hint}',
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
                                    ]
                                ))))
                ])


        );



      });



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