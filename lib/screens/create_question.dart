import 'package:flutter/material.dart';
import 'package:PizzaRush/models/question.dart';  

class CreateQuestion extends StatefulWidget {
  @override
  _CreateQuestionState createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {

  final storyContext = TextEditingController();
  final mathQuestion = TextEditingController();
  final a1 = TextEditingController();
  final a2 = TextEditingController();
  final a3 = TextEditingController();
  final a4 = TextEditingController();
  final correctAnswer = TextEditingController();
  final hints = TextEditingController();

  String dropdownValue_topic='Algebra'; 
  String dropdownValue_level='Easy'; 
  String dropdownValue_character='Chef'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(
          shrinkWrap: true,

          children: <Widget>[ 
          
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(12.0),
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
              items: <String>['Algebra', 'Geometry', 'Trigonometry']
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
            padding: const EdgeInsets.all(12.0),
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
              items: <String>['Easy', 'Medium', 'Hard']
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
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'SELECT GAME WORLD CHARACTER',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Center(
            
            child: DropdownButton<String>(
              value: dropdownValue_character,
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
                  dropdownValue_character = newValue;
                });
              },
              items: <String>['Chef', 'Cashier', 'Customer']
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
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'CONTEXT STORY',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              maxLines: 5,
              controller: storyContext, 
              decoration: InputDecoration(
                labelText: 'Write story context here.',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'MATHEMATICS QUESTION',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),

            child: TextField(
              maxLines: 5,
              controller: mathQuestion,
              decoration: InputDecoration(
                labelText: 'Type question here.',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'HINT',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              maxLines: 5,
              controller: hints, 
              decoration: InputDecoration(
                labelText: 'Write question hint here.',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'A.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: a1, 
              decoration: InputDecoration(
                labelText: 'Enter candidate answer 1.',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'B.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: a2, 
              decoration: InputDecoration(
                labelText: 'Enter candidate answer 2.',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'C.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: a3, 
              decoration: InputDecoration(
                labelText: 'Enter candidate answer 3.',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'D.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: a4, 
              decoration: InputDecoration(
                labelText: 'Enter candidate answer 4.',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
            'CORRECT ANSWER',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: a4, 
              decoration: InputDecoration(
                labelText: 'Enter correct candidate answer',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          SizedBox(height: 30),

          Container(

            height:50,
            width: 100,

            child: RaisedButton(
            onPressed: () {

              // Instantiate Question object for upload to firebase.
              Question q = Question(

                id: '', // NEED TO UPDATE QUESTION ID 
                topic: dropdownValue_topic,
                level: dropdownValue_level,
                character: dropdownValue_character,
                storyContext: storyContext.text,
                question: mathQuestion.text,
                imageUrl:'',
                answer1: a1.text,
                answer2: a2.text,
                answer3: a3.text,
                answer4: a4.text,
                correctanswer:correctAnswer.text,
                hint: hints.text, 
                points: calculatePoints(dropdownValue_level) 
                );

              // Pass object q to a services function that uploads it to firebase.

            },
            child: const Text(
              'UPLOAD',
              style: TextStyle(fontSize: 20)
              ),
            ),
          ),
          SizedBox(height: 30),
        ]
      ),
    ); 
  }
}

double calculatePoints(String level)
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