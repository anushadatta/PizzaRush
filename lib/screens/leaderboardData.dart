import 'package:flutter/material.dart';
import 'package:PizzaRush/models/leaderboardClass.dart'; 

class Algebra extends StatefulWidget {
  @override
  _AlgebraState createState() => _AlgebraState();
}

class _AlgebraState extends State<Algebra> {

  List<Leaderboard> l = [
    Leaderboard(name:'Kourtney', points:5700),
    Leaderboard(name:'Robert', points:3200),
    Leaderboard(name:'Travis', points:2110),
    Leaderboard(name:'Chyna', points:800),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(                                  
      
      children: <Widget> [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Text('NAME', 
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), 

          Container(
          height: 40.0,
          width: 1.0,
          color: Colors.grey,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),

          Text('POINTS',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

          ],
        ),
      ), 

      Container(
        height: 1.5,
        color: Colors.grey,
      ),

      Expanded(
          child: ListView.builder
          (
          itemCount: l.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(l[index].name,
                style: TextStyle(height: 2.5, fontSize: 28),
                ),

                Text(l[index].points.toInt().toString(),
                style: TextStyle(height: 2.5, fontSize: 28),
                ),
              ],
            );
          }
        ),
      )
    ] 
  );
}
}

class Geometry extends StatefulWidget {
  
  @override
  _GeometryState createState() => _GeometryState();
}

class _GeometryState extends State<Geometry> {
  List<Leaderboard> l = [
    Leaderboard(name:'Kendall', points:5000),
    Leaderboard(name:'Kylie', points:4600),
    Leaderboard(name:'Kim', points:3000),
    Leaderboard(name:'Khloe', points:2500),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(                                  
      
      children: <Widget> [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Text('NAME', 
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), 

          Container(
          height: 40.0,
          width: 1.0,
          color: Colors.grey,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),

          Text('POINTS',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

          ],
        ),
      ), 

      Container(
        height: 1.5,
        color: Colors.grey,
      ),

      Expanded(
          child: ListView.builder
          (
          itemCount: l.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(l[index].name,
                style: TextStyle(height: 2.5, fontSize: 28),
                ),

                Text(l[index].points.toInt().toString(),
                style: TextStyle(height: 2.5, fontSize: 28),
                ),
              ],
            );
          }
        ),
      )
    ] 
  );
}
}

class Trigo extends StatefulWidget {
  @override
  _TrigoState createState() => _TrigoState();
}

class _TrigoState extends State<Trigo> {

  List<Leaderboard> l = [
    Leaderboard(name:'Kris', points:5000),
    Leaderboard(name:'Stormi', points:4600),
    Leaderboard(name:'North', points:3000),
    Leaderboard(name:'Chicago', points:2500),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(                                  
      
      children: <Widget> [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Text('NAME', 
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), 

          Container(
          height: 40.0,
          width: 1.0,
          color: Colors.grey,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),

          Text('POINTS',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

          ],
        ),
      ), 

      Container(
        height: 1.5,
        color: Colors.grey,
      ),

      Expanded(
          child: ListView.builder
          (
          itemCount: l.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(l[index].name,
                style: TextStyle(height: 2.5, fontSize: 28),
                ),

                Text(l[index].points.toInt().toString(),
                style: TextStyle(height: 2.5, fontSize: 28),
                ),
              ],
            );
          }
        ),
      )
    ] 
  );
}
}