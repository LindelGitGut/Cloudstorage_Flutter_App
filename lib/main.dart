import 'package:cloudstorage_flutter_app/test/LoginPage.dart';
import 'package:cloudstorage_flutter_app/test/singuptest.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      },
    );
  }
}
