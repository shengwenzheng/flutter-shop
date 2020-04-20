import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './home.dart';
import './category.dart';
import './cart.dart';
import './member.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('我的')
    )
  ];

  final List<Widget> tabBodies = [
    Home(),
    Category(),
    Cart(),
    Member()
  ];
  int _index = 0;
  var _page;
  @override
  void initState() { 
    super.initState();
    _page = tabBodies[_index];
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750,height: 1334);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            _index = index;
            _page = tabBodies[index];
          });
        },
      ),
      body: IndexedStack(
        index: _index,
        children: tabBodies
      )
    );
  }
}