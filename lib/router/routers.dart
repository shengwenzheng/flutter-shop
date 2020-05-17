import 'package:flutter/material.dart';
import './router_hander.dart';
import 'package:fluro/fluro.dart';

class Routes{
  static String root = '/';
  static String detail = '/detail';
  static void configureRoutes(Router router){
    HandlerFunc: (BuildContext context,Map<String,List<String>> params){
      print('error page');
    };

    router.define(detail, handler: detailHander);
  }
}