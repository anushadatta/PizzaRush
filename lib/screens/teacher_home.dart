import 'package:flutter/material.dart';
import 'create_question.dart';
import 'teacher_class_performance.dart';
import 'leaderboard.dart';

class TeacherHome extends StatefulWidget {
  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  int _selectedIndex = 0;

  List <Widget> _pages = [CreateQuestion(),ClassPerformance(),Leaderboard()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
              width:30.0,
              //child: Image.asset('assets/PizzaRush.png'),
            ),
            Text('PizzaRush'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              
              // LOGOUT 
              
            },
          )
        ],
      ),
      
      body: _pages.elementAt(_selectedIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            title: Text('Upload Question'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart), //grade local activity local library people outline pie chart scatterplot show_chart trending up
            title: Text('Class Performance'),
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
