import 'package:PizzaRush/screens/selectquestionlevel.dart';
import 'storycontext.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SolveQuestions extends StatefulWidget {
  @override
  _SolveQuestionsState createState() => _SolveQuestionsState();
}

class _SolveQuestionsState extends State<SolveQuestions> {
  static String topicchosen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                    'SELECT MATH TOPIC',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  )
                ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: Container(
                width: 300.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () async {
                    setState(() {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => StoryContextA()));

                    });
                  },
                  child: Text(
                    'ALGEBRA',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.white70,
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: Container(
                width: 300.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () async {
                    setState(() {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => StoryContextT()));
                    });
                  },
                  child: Text(
                    'TRIGONOMETRY',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.white70,
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: Container(
                width: 300.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () async {
                    setState(() {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => StoryContextG()));

                    });
                  },
                  child: Text(
                    'GEOMETRY',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.white70,
                ),
              )),
        ],
      ),
    );
  }
}