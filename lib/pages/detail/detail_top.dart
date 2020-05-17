import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/detail.dart';

class DetailTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailPrivide>(
      builder: (context,child,val){
        var goodsInfo = Provide.value<DetailPrivide>(context).songDetail;
        if(goodsInfo != null){
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                _goodsImg(goodsInfo.imgUrl),
                _goodsName(goodsInfo.title),
                _goodsPrice(goodsInfo.payPrice, goodsInfo.oriPrice)
              ]
            ),
          );
        }else{
          print('数据加载中');
        }
      }
    );
  }

  //商品图片
  Widget _goodsImg(url){
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  //商品名称
  Widget _goodsName(name){
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0,top: 5.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30)
        )
      ),
    );
  }

  Widget _goodsPrice(payPrice,oriPrice){
    return Container(
      width: ScreenUtil().setWidth(740),
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.only(left: 15.0),
      child: Row(
        children:<Widget>[
          Text(
            '¥ ${payPrice}',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40)
            ),
          ),
          Text(
            ' 市场价: ¥${oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ]
      )
    );
  }
}