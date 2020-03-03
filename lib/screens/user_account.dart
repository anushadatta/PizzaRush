import 'package:flutter/material.dart';
import 'login.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
        title: Text('Player History'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
        ), 
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        // Sign out, to LoginScreen()
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        label: Text('SIGN OUT'),
        icon: Icon(Icons.exit_to_app),
        backgroundColor: Colors.grey,
        
      ),
    );

   
  }
}