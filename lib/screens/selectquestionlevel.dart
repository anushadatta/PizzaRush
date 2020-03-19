import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_account.dart';
import 'questionscreen.dart';
import 'package:PizzaRush/services/collections.dart';
import 'package:flushbar/flushbar.dart';

class SelectQuestionLevel extends StatefulWidget {
  var topicchosen;

  SelectQuestionLevel({@required this.topicchosen});
  @override
  _SelectQuestionLevelState createState() => _SelectQuestionLevelState();
}

class _SelectQuestionLevelState extends State<SelectQuestionLevel> {

  Future<int> easyattempts;
  Future<int> mediumattempts;
  bool mediumlock = true;
  bool hardlock = true;

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
                      setState(() {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => QuestionScreen(topicchosen: widget.topicchosen, level: 'easy')));
                      });
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
                    onPressed: mediumlock? (){
                      showInfoFlushbar(context);
                    }: () async {
                      setState(() {
                        Navigator.push(context, CupertinoPageRoute(
                            builder: (context) =>
                                QuestionScreen(topicchosen: widget.topicchosen,
                                    level: 'medium')));
                      });
                    },
                    child: mediumlock?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'MEDIUM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(Icons.lock)
                      ]
                    ) : Text(
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
                    onPressed: hardlock? (){
                      showInfoFlushbar(context);
                    }: () async {
                      setState(() {
                        Navigator.push(context, CupertinoPageRoute(
                            builder: (context) =>
                                QuestionScreen(topicchosen: widget.topicchosen,
                                    level: 'hard')));
                      });
                    },
                    child: hardlock?
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HARD',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.lock)
                        ]
                    ) : Text(
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

  void setLockStatus() async{
    if(await easyattempts>=1){
      setState(() {
        mediumlock = false;
      });
    }

    if(await mediumattempts>=1){
      setState(() {
        hardlock = false;
      });
    }
  }

  void initState() {
    super.initState();
    setState(() {
      easyattempts =
          Collections().getPreviousAttempts(widget.topicchosen, 'easy');
      mediumattempts =
          Collections().getPreviousAttempts(widget.topicchosen, 'medium');
      setLockStatus();
    });
  }

  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Level Locked!',
      message: 'Please attempt the previous levels first.',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.green[900],
      ),
      leftBarIndicatorColor: Colors.green[900],
      duration: Duration(seconds: 3),
    )..show(context);
  }


}