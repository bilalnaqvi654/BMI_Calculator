import 'dart:math';
class Calculate{
final int hieght; 
final int weight ;
Calculate({this.hieght,this.weight});
double _bmi;
String CalculateBMI()
{
  _bmi= weight/pow(hieght/100, 2);
  return _bmi.toStringAsFixed(1);
}
String getResult()
{
  if(_bmi>=25)
  {
    return 'Overweight';
  }
  if(_bmi>18.5)
  {
    return 'Normal';
  }
  else
  {
    return 'Under Weight';
  }
}
String compliments()
{
  if(_bmi>=25)
  {
    return 'You are over weight do more excercise';
  }
  if(_bmi>18.5)
  {
    return 'Your weight is normal well job done';
  }
  else
  {
    return 'you are under weight kindly eat more';
  }
}

}