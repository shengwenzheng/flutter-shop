import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _selectAll(),
          _allPrice(),
          _goButton()
        ],
      )
    );
  }

  Widget _selectAll(){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Colors.pink,
            value: true,
            onChanged: (bool val){},
          ),
          Text('全选')
        ]
      ),
    );
  }

  Widget _allPrice(){
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(280),
                alignment: Alignment.centerRight,
                child: Text(
                  '合计',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36))
                )
              ),
              Container(
                width: ScreenUtil().setWidth(150),
                alignment: Alignment.centerLeft,
                child: Text(
                  '￥1992',
                  style: TextStyle(color: Colors.red,fontSize: ScreenUtil().setSp(36))
                )
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满99元免配送费，预购从速',
              style: TextStyle(color: Colors.black38,fontSize: ScreenUtil().setSp(22))
            )
          )
        ]
      ),
    );
  }

  Widget _goButton(){
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap:(){},
        child: Container(
          child: Text('结算',style:TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(32))),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0)
          ),
        )
      )
    );
  }
}