import 'package:flutter/material.dart';

class ChallengeFriend extends StatefulWidget {
  @override
  _ChallengeFriendState createState() => _ChallengeFriendState();
}

class _ChallengeFriendState extends State<ChallengeFriend> {
  String dropdownValue ='Sam';
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Text('Challenge'),
          centerTitle: true,
          backgroundColor: Colors.red[200],

          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              onPressed: () {
                // Should go to User Account page
                // UserAccount()

              },
            )
          ],
        ),

        body:
    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Select Friend to Challenge',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 2,)]),


          SizedBox(height: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 70,
                elevation: 32,
                style: TextStyle(
                  color: Colors.green[800],
                ),
                underline: Container(
                  height: 4,
                  width: 12,
                  color: Colors.white,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Sam', 'Joe','Sandy']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,textScaleFactor: 3),
                  );
                })
                    .toList(),
              )]),










SizedBox(height: 100),


          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 25,),
                Expanded(child:FlatButton(
                  color: Colors.blue[200],
                  padding: EdgeInsets.all(20),
                  onPressed: (){
                  },
                  child: Text(
                    "Challenge",textScaleFactor: 3,),

                )),
                SizedBox(width: 25,),])    ]));
  }
}