import 'package:chapa/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.deepPurpleAccent[500],
        backgroundColor: Colors.orange,
        errorColor: Colors.red,
      ),
      home: SplashScreen(),
    );
  }
}
