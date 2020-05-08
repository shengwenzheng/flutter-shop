import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import './config/service.dart';

Future getHomeData() async {
  try {
    print('首页数据。。。');
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['homeContext']);
    if(response.statusCode == 200){
      return response.data['result'];
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
 
  } catch (e) {
    return print('出错啦:======>${e}');
  }
}

Future getHotGoods() async {
  try {
    print('首页数据。。。');
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['hotGoods']);
    if(response.statusCode == 200){
      return response.data['result'];
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
 
  } catch (e) {
    return print('出错啦:======>${e}');
  }
}

Future getCategory() async {
  try {
    print('分类数据。。。');
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['musicRankings']);
    if(response.statusCode == 200){
      return response.data['result'];;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
 
  } catch (e) {
    return print('出错啦:======>${e}');
  }
}