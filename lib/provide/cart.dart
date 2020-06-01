import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/cart.dart';

class CartProvide with ChangeNotifier{
  String cartString = "[]";
  List<CartMode> cartList = [];

  save(id,name,count,price,image) async{
    print(id);
    SharedPreferences prefs = await SharedPreferences.getInstance(); //初始化SharedPreferences
    cartString = prefs.getString('cartInfo'); //获取持久化存储的值
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    var isHave = false;
    int index = 0;
    tempList.forEach((item) { 
      if(item['id'] == id){
        tempList[index]['count'] = item['count'] + 1;
        cartList[index].count++;
        isHave = true;
      }
      index++;
    });
    if(!isHave){
      Map<String,dynamic> tempGoods = {
        'id': id,
        'title': name,
        'count': count,
        'payPrice': price,
        'imgUrl': image
      };
      tempList.add(tempGoods);
      cartList.add(CartMode.fromJson(tempGoods));
    }
    cartString = json.encode(tempList).toString();
    print(cartString);
    print(cartList);
    prefs.setString('cartInfo', cartString);//设置持久化
  }

  remove()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    cartList = [];
    notifyListeners();
  }

  getCartData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获得购物车中的商品 字符串
    cartString = prefs.getString('cartInfo');
    cartList = [];
    if(cartString == null){
      cartList = [];
    }else{
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((item) { 
        cartList.add(CartMode.fromJson(item));
      });
    }
    notifyListeners();
  }
}