import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'screens/login.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main(){
  SyncfusionLicense.registerLicense("NT8mJyc2IWhiZH1nfWN9YGpoYmF8YGJ8ampqanNiYmlmamlmanMDHmg+NjsmP2NjYhM2fT0nJn02NyZ9IDQ=");
  return runApp(MyApp());
}

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
