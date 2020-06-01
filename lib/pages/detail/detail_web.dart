import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../provide/detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provide.value<DetailPrivide>(context).songDetail.detailHTML;
    return Provide<DetailPrivide>(
      builder: (context,child,val){
        var isLeft = Provide.value<DetailPrivide>(context).isLeft;
        if(isLeft){
          print(goodsDetail);
          return Container(
            child: Html(data: goodsDetail)
          );
        }else{
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child:Text('暂时没有评论')
          );
        }
      },
    );
    
  }
}