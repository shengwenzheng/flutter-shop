import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
import '../model/catetory.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service.dart';
import '../provide/child_category.dart';

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
              RightNav(),
              SongCategoryList()
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
  var leftIndex = 0;
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
      onTap:(){
        var childList = list[index]['content'];
        Provide.value<ChildCategory>(context).getChildCategory(childList);
        setState(() {
          leftIndex = index;
        });
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left:10,top:20),
        decoration: BoxDecoration(
          color:leftIndex == index ? Color.fromRGBO(236, 236, 236, 1.0) : Colors.white,
          border: Border(
            bottom: BorderSide(width:1,color: Colors.black12)
          )
        ),
        child: Text(list[index]['name'],style: TextStyle(fontSize: ScreenUtil().setSp(28))),
      ),
    );
  }
  void _getCategory() async{
    await getCategory().then((val){
      // var data = json.decode(val.toString());
      // CategoryModel category = CategoryModel.fromJson(val);
      setState(() {
        list = val;
      });
      Provide.value<ChildCategory>(context).getChildCategory(val[0]['content']);
    });
  }
}

class RightNav extends StatefulWidget {
  @override
  _RightNavState createState() => _RightNavState();
}

class _RightNavState extends State<RightNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<ChildCategory>(builder: (context,child,childCategory){
        return Container(
          height: ScreenUtil().setHeight(65),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width:1,color: Colors.black12))
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _rightInkwell(childCategory.childCategoryList[index]);
            },
          ),
        );
      }) 
    );
  }

  Widget _rightInkwell(item){
    return InkWell(
      onTap:(){},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item['title'],
          style: TextStyle(fontSize: ScreenUtil().setSp(28))
        )
      )
    );
  }
}

class SongCategoryList extends StatefulWidget {
  @override
  _SongCategoryListState createState() => _SongCategoryListState();
}

class _SongCategoryListState extends State<SongCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<ChildCategory>(builder: (context,child,childCategory){
        return Container(
          height: ScreenUtil().setHeight(900),
          width: ScreenUtil().setWidth(570),
          child: ListView.builder(
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
            return _listSong(childCategory.childCategoryList,index);
           },
          ),
        );
      }),
    );
  }

  Widget _songImage(list, index){
    return Container(
      width: ScreenUtil().setWidth(200),
      child:  Image.network(list[index]['pic_big'])
    );
  }

  Widget _songName(list,index){
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child:Text(
          list[index]['title'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: ScreenUtil().setSp(28))
        )
    );
  }

  Widget _songAuthor(list,index){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
          list[index]['author'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: ScreenUtil().setSp(24))
        )
    );
  }

  Widget _listSong(List list,int index){
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _songImage(list,index),
            Column(
              children: <Widget>[
                _songName(list,index),
                _songAuthor(list,index)
              ]
            )
          ]
        )
      )
    );
  }
}