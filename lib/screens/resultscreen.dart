import 'package:flutter/material.dart';

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