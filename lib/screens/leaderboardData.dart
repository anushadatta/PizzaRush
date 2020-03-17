import 'package:flutter/material.dart';
import 'package:PizzaRush/models/leaderboardClass.dart'; 
import 'package:PizzaRush/services/collections.dart';

class Algebra extends StatefulWidget {
  @override
  _AlgebraState createState() => _AlgebraState();
}

class _AlgebraState extends State<Algebra> {

  // Testing Firebase for Leaderboard 
  Future<List> lA;
  // List<Leaderboard> l = [
  //   Leaderboard(name:'Kourtney', points:5700),
  //   Leaderboard(name:'Robert', points:3200),
  //   Leaderboard(name:'Travis', points:2110),
  //   Leaderboard(name:'Chyna', points:800),
  // ];

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
      buildLeaderboardList(lA)
    ] 
  );
}

Widget buildLeaderboardList(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green)),
                  ),
                ),
              ],
            )
        );
        if (snapshot.data.length == 0) {
          return Container(
              height: 300,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      child: Text("No Data!", style: TextStyle(
                          fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              )
          );
        }

        return Expanded(
          child: ListView.builder
          (
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(snapshot.data[index].name,
                style: TextStyle(height: 2.5, fontSize: 28),
                ),

                Text(snapshot.data[index].points.toInt().toString(),
                style: TextStyle(height: 2.5, fontSize: 28),
                ),
              ],
            );
          }
        ),
      );
      });

  void initState() {
    super.initState();
    setState(()  {
      lA = Collections().getLeaderboardData('algebra');
    });
  }

}

class Geometry extends StatefulWidget {
  @override
  _GeometryState createState() => _GeometryState();
}

class _GeometryState extends State<Geometry> {

  // Testing Firebase for Leaderboard 
  Future<List> lG;
  // List<Leaderboard> l = [
  //   Leaderboard(name:'Kourtney', points:5700),
  //   Leaderboard(name:'Robert', points:3200),
  //   Leaderboard(name:'Travis', points:2110),
  //   Leaderboard(name:'Chyna', points:800),
  // ];

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
      buildLeaderboardList(lG)
    ] 
  );
}

Widget buildLeaderboardList(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green)),
                  ),
                ),
              ],
            )
        );
        if (snapshot.data.length == 0) {
          return Container(
              height: 300,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      child: Text("No Data!", style: TextStyle(
                          fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              )
          );
        }

        return Expanded(
          child: ListView.builder
          (
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(snapshot.data[index].name,
                style: TextStyle(height: 2.5, fontSize: 28),
                ),

                Text(snapshot.data[index].points.toInt().toString(),
                style: TextStyle(height: 2.5, fontSize: 28),
                ),
              ],
            );
          }
        ),
      );
      });

  void initState() {
    super.initState();
    setState(()  {
      lG = Collections().getLeaderboardData('geometry');
    });
  }

}

class Trigonometry extends StatefulWidget {
  @override
  _TrigonometryState createState() => _TrigonometryState();
}

class _TrigonometryState extends State<Trigonometry> {

  // Testing Firebase for Leaderboard 
  Future<List> lT;
  // List<Leaderboard> l = [
  //   Leaderboard(name:'Kourtney', points:5700),
  //   Leaderboard(name:'Robert', points:3200),
  //   Leaderboard(name:'Travis', points:2110),
  //   Leaderboard(name:'Chyna', points:800),
  // ];

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
      buildLeaderboardList(lT)
    ] 
  );
}

Widget buildLeaderboardList(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green)),
                  ),
                ),
              ],
            )
        );
        if (snapshot.data.length == 0) {
          return Container(
              height: 300,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      child: Text("No Data!", style: TextStyle(
                          fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              )
          );
        }

        return Expanded(
          child: ListView.builder
          (
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(snapshot.data[index].name,
                style: TextStyle(height: 2.5, fontSize: 28),
                ),

                Text(snapshot.data[index].points.toInt().toString(),
                style: TextStyle(height: 2.5, fontSize: 28),
                ),
              ],
            );
          }
        ),
      );
      });

  void initState() {
    super.initState();
    setState(()  {
      lT = Collections().getLeaderboardData('trigonometry');
    });
  }

}

