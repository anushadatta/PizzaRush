import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      primaryIconTheme: IconThemeData(color: Colors.black)
      ),
      
      // Wrapper widget branches to Home() and Login()
      home: LoginScreen(),

    );
  }
}
