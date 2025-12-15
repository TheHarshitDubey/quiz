import 'package:flutter/material.dart';

class PageConnect with ChangeNotifier{
  bool? isEligible;
  String? message="";
  void ageCheck(int age){
    if(age>=18){
      isEligible=true;
      message="Eligible for Driving Liscence";
      notifyListeners();
    }else{
      isEligible=false;
      message="Not Eligible for Driving Liscence";
      notifyListeners();
    }
  }
}