import 'dart:async';

import 'package:chapa/screens/home.dart';
import 'package:chapa/screens/on_boarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {





  _getUserSession() async {
    final userPrefs = await SharedPreferences.getInstance();
    bool onBoardingDone = userPrefs.getBool("onBoardingDone") ?? false;
    if(onBoardingDone){
      Timer(
          Duration(seconds: 2),
              () => Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) => Home())));
    }else{
      Timer(
          Duration(seconds: 2),
              () => Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) => OnBoardingScreen())));
    }



  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserSession();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.teal.shade600,
                        radius: MediaQuery.of(context).size.height * 0.2,
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset("assets/images/logo-2.png")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//              Expanded(
//                  flex: 1,
//                  child: Align(
//                    alignment: Alignment.bottomCenter,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      children: <Widget>[
//                        Text("Powered by",
//                            style:
//                            TextStyle(color: Colors.white, fontSize: 12)),
//                        Padding(
//                          padding: EdgeInsets.only(
//                              bottom:
//                              MediaQuery.of(context).size.height * 0.01),
//                          child: new Image.asset(
//                            'assets/images/medco_logo.png',
//                            height: MediaQuery.of(context).size.height * 0.03,
//                            fit: BoxFit.scaleDown,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ))
            ],
          )
        ],
      ),
    );
  }
}