import 'package:flutter/material.dart';
import 'constant.dart';
class ReuseableCard extends StatelessWidget {
final IconData myicons;
final String myText;
ReuseableCard({@required this.myText, @required this.myicons});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
         myicons,
         size :80.0,

        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          myText,
          style: labelstyle,
        ),
      ],
    );
  }
}