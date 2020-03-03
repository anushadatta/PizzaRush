import 'package:flutter/material.dart';

import 'solvequestions.dart';
import 'leaderboard.dart';
import 'challenge.dart';
import 'user_account.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List <Widget> _pages = [SolveQuestions(),Challenge(),Leaderboard(), UserAccount()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      appBar: AppBar(
        title: Text('PizzaRush'),
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
            },
          )
        ],
      ),
      
      body: _pages.elementAt(_selectedIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            title: Text('Solve Questions'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Challenge'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Leaderboard'),
          ),

        ],
        
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,

      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;

    });
  }
}
