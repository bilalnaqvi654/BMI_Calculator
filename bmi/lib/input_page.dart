import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReuseableWidget.dart';
import 'Reuseablecard.dart';
import 'constant.dart';
import 'result_page.dart';
import 'gesture.dart';
import 'calculations.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor = inactivecardColor;
Color femaleCardColor = inactivecardColor;
enum Gender {
  male,
  female,
}
Gender SelectedGender;
int hieght = 180;
int weight = 40;
int age = 1;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableWidget(
                    Onpress: () {
                      setState(() {
                        SelectedGender = Gender.male;
                      });
                    },
                    colour: SelectedGender == Gender.male
                        ? activecardColor
                        : inactivecardColor,
                    Cardchild: ReuseableCard(
                        myicons: FontAwesomeIcons.mars, myText: 'male'),
                  ),
                ),
                Expanded(
                  child: ReuseableWidget(
                    Onpress: () {
                      setState(() {
                        SelectedGender = Gender.female;
                      });
                    },
                    colour: SelectedGender == Gender.female
                        ? activecardColor
                        : inactivecardColor,
                    Cardchild: ReuseableCard(
                        myicons: FontAwesomeIcons.venus, myText: 'female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableWidget(
              colour: activecardColor,
              Cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HIEGHT',
                    style: labelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        hieght.toString(),
                        style: numberStyle,
                      ),
                      Text(
                        'cm',
                        style: labelstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: hieght.toDouble(),
                      min: 100,
                      max: 500,
                      onChanged: (double newvalue) {
                        setState(() {
                          hieght = newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableWidget(
                    colour: activecardColor,
                    Cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelstyle,
                        ),
                        Text(weight.toString(), style: numberStyle),
                        Row(
                          children: <Widget>[
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              Onpressed: () {
                                setState(() {
                                  if (weight < 150) {
                                    weight = weight + 1;
                                  } else {
                                    weight = 0;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              Onpressed: () {
                                setState(() {
                                  if (weight >= 0) {
                                    weight = weight - 1;
                                  } else {
                                    weight = 0;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableWidget(
                    colour: activecardColor,
                    Cardchild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: labelstyle),
                        Text(
                          age.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          children: <Widget>[
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              Onpressed: () {
                                setState(() {
                                  if (age < 100) {
                                    age++;
                                  } else {
                                    age = 1;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              Onpressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  } else {
                                    age = 1;
                                  }
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gesturebutton(buttonText: 'Calculate',onpressed: (){
            Calculate cal =Calculate(hieght:hieght,weight:weight);
          
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
          bmiresult: cal.CalculateBMI(),
          resulttext: cal.getResult(),
          compliments: cal.compliments(),

        )));
      },
      ),
        ],
      ),
    );
  }
}



      
class RoundActionButton extends StatelessWidget {
  final IconData icon;
  final Function Onpressed;
  RoundActionButton({this.icon, this.Onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: Onpressed,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
