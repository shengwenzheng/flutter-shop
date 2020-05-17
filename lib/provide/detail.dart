import 'package:flutter/material.dart';
import '../model/detail.dart';
import '../service.dart';
import 'dart:convert';

class DetailPrivide with ChangeNotifier {
  Detail songDetail = null;

  bool isLeft = true;
  bool isRight = false;

  getSongDetail(){
    getDetail().then((val){
      print(val);
      songDetail = Detail.fromJson(val);
      notifyListeners();
    });
  }

  tabBarChange(String barState){
    if(barState == 'left'){
      isLeft = true;
      isRight = false;
    }else{
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}