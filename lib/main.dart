

import 'package:flutter/material.dart';

import 'auth/sessionmanager.dart';
import 'beta/HomePage.dart';
import 'beta/LoginPage.dart';
import 'beta/SingupPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  Session sessionManager = Session();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Signup Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),

      },
    );
  }
}
