import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/detail.dart';

Handler detailHander = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    return Detail(goodsId);
  }
);