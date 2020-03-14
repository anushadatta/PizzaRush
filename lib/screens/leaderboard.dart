import 'package:flutter/material.dart';
import 'leaderboardData.dart'; 

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      home: DefaultTabController(
        length: 3,
        
        child: Scaffold(
          
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(85.0),
              child: AppBar(
              
              backgroundColor: Colors.grey[50], 
               
              bottom: TabBar(
                tabs: [
                  Tab(child: Text('ALGEBRA', 
                  style: TextStyle(
                    color: Colors.blue[600], 
                    fontWeight: FontWeight.bold),
                  )),
                 
                  Tab(child: Text('GEOMETRY', 
                  style: TextStyle(
                    color: Colors.blue[600], 
                    fontWeight: FontWeight.bold,),
                  )),
                 
                  Tab(child: Text('TRIGO.', 
                  style: TextStyle(
                    color: Colors.blue[600], 
                    fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              
              title: Text('LEADERBOARD',
              style: TextStyle(fontSize: 35, color: Colors.black87, fontWeight: FontWeight.bold)),
              centerTitle: true,
              elevation: 0.0,
            ),
          ),

          body: TabBarView(
            children: [
              Algebra(),
              Geometry(),
              Trigo(),
            ],
          ),
        ),
      ),
    );
  }
}

