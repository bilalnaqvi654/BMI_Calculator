import 'package:flutter/material.dart';

const ColorString = Color(0xFF1D1E33);

class ReuseableWidget extends StatelessWidget {
  ReuseableWidget({@required this.colour, this.Cardchild,this.Onpress});
  final Color colour;
  final Widget Cardchild;
  final Function Onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpress,
          child: Container(
        child: Cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}