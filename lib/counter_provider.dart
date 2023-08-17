import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
 int _count=0;

 /*//using Setter & Getter func
//setter func
set incrementcountValue(int value){
  _count=_count+value;
  notifyListeners();
}

//setter
set decrementcountValue(int value){
  if(_count>0){
    _count=_count-value;
    notifyListeners();
  }
}

//getter func
int get CountValue{
  return _count;
}
*/


//Without setter ,getter
//set value
 void increment(){
  _count++;
   notifyListeners();
 }

 void decrement(){
  if(_count>0){
    _count--;
    notifyListeners();
  }
  }

 //get value
 int getValue(){
   return _count;
 }




}