import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flushbar/flushbar.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:PizzaRush/services/login.dart';
import 'home.dart';
import 'forgotpw.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible;

  @override
  void initState() {
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: new Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.18, // fixed width and height
                        child: Image.asset('assets/PizzaRush.png'),
                      ),
                      Text('PizzaRush',
                            style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,)
                    ]
                  )),


                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'Making learning fun!',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      )),

                  SizedBox(
                    height: 15.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: 300.0,
                      child: TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        decoration: InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),
                            focusedBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),
                            hintText: 'Email ID',
                            prefixIcon: new Icon(
                                Icons.email,
                                color: Colors.white
                            ),
                            hintStyle: TextStyle(
                                color: Colors.white
                            )
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: usernameController,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: 300.0,
                      child: TextFormField(
                        maxLines: 1,
                        autofocus: false,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)
                          ),
                          focusedBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)
                          ),
                          hintText: 'Password',
                          prefixIcon: new Icon(
                              Icons.lock,
                              color: Colors.white
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: passwordController,

                      ),
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                      child: Container(
                        width: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () async {
                            String username = usernameController.text;
                            String password = passwordController.text;

                            var sessToken = await LoginModel().handleSignIn(username, password);

                            if(sessToken!=null){
                              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Home()));}
                            else{
                              showIncorrectInfoFlushbar(context);
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.green[900],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.white,
                        ),
                      )),

                  SizedBox(height: 30.0),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                          width: 300.0,
                          height: 18.0,
                          child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ForgotScreen()));
                            },
                            child: Text(
                              'FORGOT PASSWORD?',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                ],
              )
            )
        ),
    );
  }

  Widget loadingView() => Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.green[900],
    ),
  );

  void showIncorrectInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Wrong Credentials!',
      message: 'Please try again.',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.green[900],
      ),
      leftBarIndicatorColor: Colors.green[900],
      duration: Duration(seconds: 3),
    )..show(context);
  }



}