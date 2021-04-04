import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Color buttonColor;
  double radius;
  double textSize;
  Color textColor;
  Function action;


  CustomButton(this.title, this.buttonColor, this.radius, this.textSize,
      this.textColor, this.action);


  @override
  Widget build(BuildContext context) {
    return   RaisedButton(
      color: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)),
      onPressed: action,
      child: Text(
       title,
        textAlign: TextAlign.center,
        style:
        TextStyle(fontSize: textSize, color: textColor),
      ),
    );
  }

}
