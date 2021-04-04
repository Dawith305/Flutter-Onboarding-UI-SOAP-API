import 'package:chapa/models/on_boarding_page_model.dart';
import 'package:chapa/screens/home.dart';
import 'package:chapa/screens/on_boarding_item.dart';
import 'package:chapa/utility/dummy_data.dart';
import 'package:chapa/widgets/custom_button.dart';
import 'package:chapa/widgets/on_boarding_step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int stepperPosition = 0;
  PageController pageViewController = PageController();
  List<OnBoardingPageModel> steps = DummyData().onBoardingSteps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageViewController,
        onPageChanged: (value) {
          setState(() {
            stepperPosition = value;
          });
        },
        itemCount: steps.length,
        itemBuilder: (context,index){
          return OnBoardingItem(steps[index].title, steps[index].description, steps[index].imgPath);
        },),
      bottomNavigationBar: stepperPosition != steps.length - 1 ? Container(
        padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomButton('SKIP', Theme.of(context).primaryColor, 10.0, 14.0, Colors.white, (){
              setState(() {
                stepperPosition == steps.length - 1;
                pageViewController.animateToPage(steps.length - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              });
            }),

            Row(
              children: <Widget>[
             for(int stepperIdx=0 ;stepperIdx<steps.length;stepperIdx++) stepperPosition == stepperIdx ? OnBoardingStepIndicator(true) : OnBoardingStepIndicator(false)
              ],
            ),
            CustomButton('NEXT', Theme.of(context).primaryColor, 10.0, 14.0, Colors.white, (){
                  setState(() {
                    stepperPosition++;
                    pageViewController.animateToPage(stepperPosition, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                  });
            })

          ],
        ),
      ) : Container(
        padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                CustomButton('GET STARTED', Theme.of(context).primaryColor, 10.0, 14.0, Colors.white, (){
                  finishOnBoarding();
                })
        ],),
      ) ,
    );
  }

  void finishOnBoarding() async {
    var userPrefs = await SharedPreferences.getInstance();
    await userPrefs.setBool("onBoardingDone", true);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
  }
}