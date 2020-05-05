import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/catetory.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类')),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftNav(),
            Column(children: <Widget>[
              RightNav()
            ],)
          ])
      ),
    );
  }
}

//左侧大类导航
class LeftNav extends StatefulWidget {
  @override
  _LeftNavState createState() => _LeftNavState();
}

class _LeftNavState extends State<LeftNav> {
  List list = [];
  @override
  void initState() { 
    _getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width:1,color:Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
          return _leftInkWell(index);
        }
      ),
    );
  }
  Widget _leftInkWell(int index){
    return InkWell(
      onTap:(){},
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left:10,top:20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width:1,color: Colors.black12)
          )
        ),
        child: Text(list[index].data.title,style: TextStyle(fontSize: ScreenUtil().setSp(28))),
      ),
    );
  }
  void _getCategory() async{
    await getCategory().then((val){
      // var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(val);
      setState(() {
        list = category.itemList;
      });
    });
  }
}

class RightNav extends StatefulWidget {
  @override
  _RightNavState createState() => _RightNavState();
}

class _RightNavState extends State<RightNav> {
  List list  = ['名酒','宝丰','二锅头','五粮液','茅台','碗酒','铫子','习酒'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: ScreenUtil().setHeight(65),
        width: ScreenUtil().setWidth(570),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width:1,color: Colors.black12))
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
          return _rightInkwell(list[index]);
         },
        ),
      ),
    );
  }

  Widget _rightInkwell(String item){
    return InkWell(
      onTap:(){},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(item,style: TextStyle(fontSize: ScreenUtil().setSp(28)))
      )
    );
  }
}