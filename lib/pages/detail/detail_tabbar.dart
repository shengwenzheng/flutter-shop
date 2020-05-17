import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/detail.dart';

class DetailTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailPrivide>(
      builder: (context,child,val){
        var isLeft = Provide.value<DetailPrivide>(context).isLeft;
        var isRight = Provide.value<DetailPrivide>(context).isRight;
        
        return Container(
          margin: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              _tabbarLeft(context,isLeft),
              _tabbarRight(context,isRight),
            ]
          )
        );
      }
    );
  }

  Widget _tabbarLeft(BuildContext context,bool isLeft){
    return InkWell(
      onTap: (){
        Provide.value<DetailPrivide>(context).tabBarChange('left');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(355),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom:BorderSide(
              width: 1.0,
              color: isLeft ? Colors.pink : Colors.black
            ),
          ) 
        ),
        child: Text(
          '详细',
          style:TextStyle(
            color: isLeft ? Colors.pink : Colors.black
          )
        ),
      ),
    );
  }

  Widget _tabbarRight(BuildContext context,bool isRight){
    return InkWell(
      onTap: (){
        Provide.value<DetailPrivide>(context).tabBarChange('right');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(335),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom:BorderSide(
              width: 1.0,
              color: isRight ? Colors.pink : Colors.black
            ),
          ) 
        ),
        child: Text(
          '评价',
          style:TextStyle(
            color: isRight ? Colors.pink : Colors.black
          )
        ),
      ),
    );
  }
}