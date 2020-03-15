import 'package:flutter/material.dart';
import 'user_account.dart';

class SelectQuestionLevel extends StatefulWidget {
  var topicchosen;

  SelectQuestionLevel({@required this.topicchosen});
  @override
  _SelectQuestionLevelState createState() => _SelectQuestionLevelState();
}

class _SelectQuestionLevelState extends State<SelectQuestionLevel> {

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Text(
                  'SELECT LEVEL OF DIFFICULTY',
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
                    },
                    child: Text(
                      'EASY',
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
                    },
                    child: Text(
                      'MEDIUM',
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
                    },
                    child: Text(
                      'HARD',
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
      )
    );
  }
}