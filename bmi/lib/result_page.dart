import 'package:flutter/material.dart';
import 'constant.dart';
import 'ReuseableWidget.dart';
import 'gesture.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiresult,@required this.compliments,@required this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String compliments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: titleStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableWidget(
                colour: activecardColor,
                Cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resulttext.toUpperCase(),
                      style: ResultTextStyle,
                    ),
                    Text(bmiresult, style: BMIstyle),
                    Text(compliments.toUpperCase(),
                        textAlign: TextAlign.center, style: bmibodyStyle)
                  ],
                ),
              ),
            ),
            Gesturebutton(buttonText: 'RE-CALCULATE',onpressed: (){

              Navigator.pop(context);
            },)
          ],
        ));
  }
}
