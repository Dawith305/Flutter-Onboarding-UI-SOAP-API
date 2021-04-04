import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  String title;
  String description;
  String imgPath;

  OnBoardingItem(this.title, this.description, this.imgPath);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/'+imgPath),
            SizedBox(height: 20,),
            Text(title,textAlign: TextAlign.center ,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(description, textAlign : TextAlign.center, style: TextStyle(),),
            )
          ],
        ),
      ),
    );
  }


}
