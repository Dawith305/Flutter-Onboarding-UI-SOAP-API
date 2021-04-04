import 'package:flutter/material.dart';

class OnBoardingStepIndicator extends StatelessWidget {
  bool isCurrentStepper;
  OnBoardingStepIndicator(this.isCurrentStepper);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCurrentStepper ? 12.0 : 5.0,
      height: isCurrentStepper ? 11.0 : 5.0,
      margin: EdgeInsets.only(left: 3,right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isCurrentStepper ? Colors.green : Colors.grey
      ),
    );
  }
}
