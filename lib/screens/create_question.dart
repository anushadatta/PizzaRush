import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flushbar/flushbar.dart';

import 'package:PizzaRush/models/question.dart';
import 'package:PizzaRush/services/collections.dart';   

class CreateQuestion extends StatefulWidget {
  @override
  _CreateQuestionState createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {

  // final storyContext = TextEditingController();
  final mathQuestion = TextEditingController();
  final a1 = TextEditingController();
  final a2 = TextEditingController();
  final a3 = TextEditingController();
  final a4 = TextEditingController();
  final correctAnswer = TextEditingController();
  final hints = TextEditingController();

  String dropdownValue_topic='algebra'; 
  String dropdownValue_level='easy';
  String dropdownValue_qtype='mcq'; 
  String dropdownValue_type='tomatoes'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(
          shrinkWrap: true,

          children: <Widget>[ 
          
          SizedBox(height: 30.0,),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 5.0),
            child: Text(
            'SELECT MATH TOPIC',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Center(
            
            child: DropdownButton<String>(
              value: dropdownValue_topic,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(
                color: Colors.black87
              ),
              underline: Container(
                height: 2,
                color: Colors.black87
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue_topic = newValue;
                });
              },
              items: <String>['algebra', 'geometry', 'trigonometry']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.center),
                  );
                })
                .toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 18.0,12.0,5.0),
            child: Text(
            'SELECT DIFFICULTY LEVEL',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),
          
          Center(
            
            child: DropdownButton<String>(
              value: dropdownValue_level,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(
                color: Colors.black87
              ),
              underline: Container(
                height: 2,
                color: Colors.black87
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue_level = newValue;
                });
              },
              items: <String>['easy', 'medium', 'hard']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.center),
                  );
                })
                .toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 18.0,12.0,5.0),
            child: Text(
            'SELECT QUESTION TYPE',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Center(
            
            child: DropdownButton<String>(
              value: dropdownValue_qtype,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(
                color: Colors.black87
              ),
              underline: Container(
                height: 2,
                color: Colors.black87
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue_qtype = newValue;
                });
              },
              items: <String>['mcq', 'count', 'size']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.center),
                  );
                })
                .toList(),
            ),
          ),

          SizedBox(height:20),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 18.0,12.0,5.0),
            child: Text(
            'SELECT QUESTION THEME ITEM',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Center(
            
            child: DropdownButton<String>(
              value: dropdownValue_type,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(
                color: Colors.black87
              ),
              underline: Container(
                height: 2,
                color: Colors.black87
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue_type = newValue;
                });
              },
              items: <String>['tomatoes', 'coins', 'plate', 'bill', 'pizza']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, textAlign: TextAlign.center),
                  );
                })
                .toList(),
            ),
          ),

          SizedBox(height:20),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0 ,12.0 ,12.0,0),
            child: Text(
            'MATHEMATICS QUESTION',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Container(
              margin: EdgeInsets.all(20),

              child: TextField(
                maxLines: 5,
                controller: mathQuestion,
                decoration: InputDecoration(
                  labelText: 'Type question here.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0 ,12.0 ,12.0,0),
            child: Text(
            'HINT',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),

            child: Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                maxLines: 5,
                controller: hints, 
                decoration: InputDecoration(
                  labelText: 'Write question hint here.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0 ,12.0 ,12.0,0),
            child: Text(
            'A.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),

            child: Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: a1, 
                decoration: InputDecoration(
                  labelText: 'Enter candidate answer 1.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0 ,12.0 ,12.0,0),
            child: Text(
            'B.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),

            child: Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: a2, 
                decoration: InputDecoration(
                  labelText: 'Enter candidate answer 2.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0 ,12.0 ,12.0,0),
            child: Text(
            'C.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),

            child: Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: a3, 
                decoration: InputDecoration(
                  labelText: 'Enter candidate answer 3.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0 ,12.0 ,12.0,0),
            child: Text(
            'D.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),

            child: Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: a4, 
                decoration: InputDecoration(
                  labelText: 'Enter candidate answer 4.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12.0 ,12.0 ,12.0,0),
            child: Text(
            'CORRECT ANSWER',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),

            child: Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: correctAnswer, 
                decoration: InputDecoration(
                  labelText: 'Enter correct candidate answer.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(70.0,20.0,70.0,20.0),
            child: Container(

              height:50,
              width: 100,

              child: RaisedButton(
              onPressed: () {

                // Instantiate Question object for upload to firebase.
                Question q = Question(

                  id: DateTime.now().toString(), // NEED TO UPDATE QUESTION ID 
                  topic: dropdownValue_topic,
                  level: dropdownValue_level,
                  question: mathQuestion.text,
                  imageUrl: getImageURL(dropdownValue_type),
                  type: dropdownValue_qtype, 
                  answer1: a1.text,
                  answer2: a2.text,
                  answer3: a3.text,
                  answer4: a4.text,
                  correctanswer:correctAnswer.text,
                  hint: hints.text, 
                  points: calculatePoints(dropdownValue_level) 
                  );

                // Pass object q to a services function that uploads it to firebase.
                Collections().uploadTeacherQuestion(q);
                
                dropdownValue_topic= 'algebra';
                dropdownValue_level='easy';
                mathQuestion.clear();
                dropdownValue_type='tomatoes';
                dropdownValue_qtype='mcq'; 
                a1.clear();
                a2.clear();
                a3.clear();
                a4.clear();
                correctAnswer.clear();
                hints.clear();

                showQuestionUploaded(context);
              },

              child: const Text(
                'UPLOAD',
                style: TextStyle(fontSize: 20)
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ]
      ),
    ); 
  }
}

int calculatePoints(String level)
{
  if(level=='Easy')
    return 10;
  
  else if(level=='Medium')
    return 20;
  
  else if(level=='Hard')
    return 30;
  
  else
    return 0; 
} 

String getImageURL(String item)
{ 
  List<String> urls=[''];
  
  if(item=='tomatoes')
    return urls[0];
  
  else if(item=='coins')
    return urls[0];
  
  else if(item=='plate')
    return urls[0];

  else if(item=='bill')
    return urls[0];

  else if(item=='pizza')
    return urls[0];
  
}

void showQuestionUploaded(BuildContext context) {
    Flushbar(
      title: 'Success!',
      message: 'Question has been uploaded to database!',
      icon: Icon(
        Icons.done_outline,
        size: 28,
        color: Colors.green[900],
      ),
      leftBarIndicatorColor: Colors.green[900],
      duration: Duration(seconds: 3),
    )..show(context);
  }