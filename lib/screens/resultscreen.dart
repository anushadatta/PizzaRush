import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_account.dart';
import 'home.dart';
import 'package:PizzaRush/services/collections.dart';

class ResultScreen extends StatefulWidget {
  var topicchosen;
  var level;
  List<bool> correct;

  ResultScreen({@required this.topicchosen, @required this.level, @required this.correct});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<int> totalscore;

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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget> [
            SizedBox(height: 40.0),

            Center(
              child: Text('${widget.topicchosen.toString().toUpperCase()} PERFORMANCE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)
              ),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget> [
                  Text('POINTS EARNED:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25)
                  ),

                  SizedBox(width: 30),

                  Container(
                    //margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 2)
                    ),

                    // POINTS VARIABLE NEEDS TO BE PUT HERE
                    child: Text("${getPointsEarned(widget.correct, widget.level)}",
                      style: TextStyle(fontSize: 24),),
                  )
                ]
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget> [
                  Text('GRADE :',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0)
                  ),

                  Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 2)
                    ),

                    // POINTS VARIABLE NEEDS TO BE PUT HERE
                    child: Text("A",
                      style: TextStyle(fontSize: 20),),
                  )
                ]
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget> [
                  Text('TOTAL POINTS:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0)
                  ),

                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 2)
                    ),

                    // POINTS VARIABLE NEEDS TO BE PUT HERE
                    child: buildTotalScore(totalscore),
                  )
                ]
            ),

            FlatButton(

                color: Colors.grey[300],
                padding: EdgeInsets.all(20.0),

                onPressed: ()
                {
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Home()));
                },
                child: Text('OK',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28.0)
                )
            ),

            SizedBox(height: 50.0),

          ]
      )
    );
  }

  Widget buildTotalScore(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {
          if (!snapshot.hasData) return Container(
          height: 20,
          width: 20,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Center(
          child: Container(
          height: 10,
          width: 15,
          margin: EdgeInsets.all(5),
          child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
          Colors.green)),
          ),
          ),
          ],
          )
          );

      return   Text("${snapshot.data}",
        style: TextStyle(fontSize: 20),);});


  int getPointsEarned(List<bool> correct, String level){
    int points;
    int numcorrect = 0;
    for(int i=0; i<correct.length; i++){
      if(correct[i]){
        numcorrect+=1;
      }
    }

    if(level == 'easy'){
      points = 10*numcorrect;
    }
    else if(level == 'medium'){
      points = 20*numcorrect;
    }
    else if(level == 'hard'){
      points = 30*numcorrect;
    }

    return points;
  }


  void initState() {
    super.initState();
    setState(()  {
      totalscore = Collections().getScore(widget.topicchosen);
    });
  }


}