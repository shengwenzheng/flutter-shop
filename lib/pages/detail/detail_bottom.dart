import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';
import '../../provide/detail.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo = Provide.value<DetailPrivide>(context).songDetail;
    var id = goodsInfo.id;
    var name = goodsInfo.title;
    var count = 1;
    var price = goodsInfo.payPrice;
    var image = goodsInfo.imgUrl;
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              width: ScreenUtil().setWidth(150),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.red
              )
            ),
          ),
          InkWell(
            onTap: ()async{
              await Provide.value<CartProvide>(context).save(id, name, count, price, image);
            },
            child: Container(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              color: Colors.green,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28)
                )
              ),
            )
          ),
          InkWell(
            onTap: ()async{
              await Provide.value<CartProvide>(context).remove();
            },
            child: Container(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                '立即购买',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28)
                ),
              ),
            )
          )
        ]
      )
    );
  }
}