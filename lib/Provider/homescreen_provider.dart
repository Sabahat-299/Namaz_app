import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier{
bool checkMark= true;
//todo: Check Button
void checkButton(){
  checkMark =!checkMark;
  notifyListeners();

}
}