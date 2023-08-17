import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
 int _count=0;

 /*//set function
 void increment(int value){
  _count++;
   notifyListeners();
 }

 //get value
 int getValue(){
   return _count;
 }
*/

//setter func
set countValue(int value){
  _count=_count+value;
  notifyListeners();
}

//getter func
int get CountValue{
  return _count;
}


}