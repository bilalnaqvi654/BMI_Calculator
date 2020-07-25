import 'package:flutter/material.dart';
import 'constant.dart';
class Gesturebutton extends StatelessWidget {
   final Function onpressed;
   final String buttonText;
Gesturebutton({@required this.onpressed, @ required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
                child: Container(
      child: Center(
        child: (
          
          Text(buttonText,style: largeButtonStyle,
          
        )
        ),
      ),
      padding: EdgeInsets.only(bottom: 20.0),
      margin: EdgeInsets.only(top: 10.0),
        color: Color(0xFFEB1555),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}