import 'package:flutter/material.dart';

class ListDataProvider extends ChangeNotifier{
  List<Map<String,dynamic>> _arrList=[];


  List<Map<String,dynamic>> getAllData(){    //provider
    return _arrList;
  }

  addData(Map<String,dynamic> value){        //context.read
    _arrList.add(value);
    notifyListeners();

  }

  updateData(int index,Map<String,dynamic> element){
    _arrList.insert(index, element);
    notifyListeners();
  }

  //update2
  update(int index,Map<String,dynamic>value){
  _arrList[index]=value;
  notifyListeners();
  }


  deleteData(int index){
    _arrList.removeAt(index);
    notifyListeners();
  }

  //delete2
  delete(Map<String,dynamic> value){
    _arrList.removeWhere((element) => element==value);
    notifyListeners();
  }

}