import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_account.dart';
import 'home.dart';

class DisplayResults extends StatefulWidget {
  @override
  _DisplayResultsState createState() => _DisplayResultsState();
}

class _DisplayResultsState extends State<DisplayResults> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget> [
          SizedBox(height: 80.0), 

          Center(
            child: Text('PERFORMANCE',
              textAlign: TextAlign.center, 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)  
            ),
          ),

        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget> [
          Text('POINTS :',
            textAlign: TextAlign.center, 
            style: TextStyle(fontSize: 30.0)
            ),
          
          Container(
            margin: const EdgeInsets.all(30.0),
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2)
            ),

            // POINTS VARIABLE NEEDS TO BE PUT HERE 
            child: Text("800", 
              style: TextStyle(fontSize: 24),), 
          )
        ]
          ),

        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget> [
          Text('GRADE :',
            textAlign: TextAlign.center, 
            style: TextStyle(fontSize: 30.0)
            ),
          
          Container(
            margin: const EdgeInsets.all(30.0),
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2)
            ),

            // POINTS VARIABLE NEEDS TO BE PUT HERE 
            child: Text("A",
              style: TextStyle(fontSize: 24),),
          )
        ]
          ),

        FlatButton(

          color: Colors.grey[300],
          padding: EdgeInsets.all(20.0),

          onPressed: ()
          {
            // GO BACK TO QUESTIONS PAGE 
          }, 
          child: Text('CANCEL', 
            textAlign: TextAlign.center, 
            style: TextStyle(fontSize: 28.0)
          )
        ),

        SizedBox(height: 80.0),

      ]
    );
  }
}
class ResultScreen extends StatefulWidget {
  var topicchosen;
  var level;
  List<bool> correct;

  ResultScreen({@required this.topicchosen, @required this.level, @required this.correct});
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

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
                    'RESULT',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  )
              ),
              for(int i=0; i<widget.correct.length; i++)
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'You answered Q$i ${getCorrectWrong(widget.correct[i])}',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  )
              ),

              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: RaisedButton(
                    child: Text('HOME'),
                    onPressed: (){
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Home()));
                    },
                  )
              ),

            ],
          ),
        )
    );
  }

  String getCorrectWrong(bool state){
    if(state){
      return 'correctly';
    }
    else{
      return 'wrongly';
    }
  }
}