import 'package:flutter/material.dart';

import 'package:PizzaRush/screens/selectquestionlevel.dart';
import 'user_account.dart';
import 'package:flutter/cupertino.dart';

class StoryContextA extends StatefulWidget {
  @override
  _StoryContextAState createState() => _StoryContextAState();
}

class _StoryContextAState extends State<StoryContextA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/pizzarush-40b2f.appspot.com/o/characters%2F3.png?alt=media&token=82be5d0c-388e-4b25-b51d-c31616d2152e'), 
              fit: BoxFit.cover,
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
                    setState(() {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectQuestionLevel(topicchosen: 'algebra')));
                    });
                  },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.grey[800],
        ),
      
    );
  }
}

class StoryContextG extends StatefulWidget {
  @override
  _StoryContextGState createState() => _StoryContextGState();
}

class _StoryContextGState extends State<StoryContextG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/pizzarush-40b2f.appspot.com/o/characters%2F1.png?alt=media&token=0972a7b0-ac29-4d81-938b-52927ef9e415'), 
              fit: BoxFit.cover,
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
                    setState(() {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectQuestionLevel(topicchosen: 'geometry')));
                    });
                  },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.grey[800],
        ),
      
    );
  }
}

class StoryContextT extends StatefulWidget {
  @override
  _StoryContextTState createState() => _StoryContextTState();
}

class _StoryContextTState extends State<StoryContextT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/pizzarush-40b2f.appspot.com/o/characters%2F2.png?alt=media&token=243af078-5ced-46e1-a673-8c5be6bd5e4f'), 
              fit: BoxFit.cover,
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
                    setState(() {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SelectQuestionLevel(topicchosen: 'trigonometry')));
                    });
                  },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.grey[800],
        ), 
    );
  }
}

