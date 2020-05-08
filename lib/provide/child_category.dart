import 'package:flutter/material.dart';
import '../model/catetory.dart';

class ChildCategory with ChangeNotifier{
  List childCategoryList = [];

  getChildCategory(List list){
    childCategoryList = list;
    notifyListeners();
  }
}