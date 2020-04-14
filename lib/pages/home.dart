import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import '../service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String homeContent = '正在获取数据...';
  @override
  void initState() { 
    getHomeData().then((val){
      setState(() {
        homeContent = val.toString();
      });
    });
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('百姓生活+')
      ),
      body: FutureBuilder(
        // future: getHomeData(),
        future: DefaultAssetBundle.of(context).loadString("assets/person.json"),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<dynamic> swiper = json.decode(snapshot.data.toString());
            List<dynamic> navigatory = json.decode(snapshot.data.toString());
            return Column(
              children: <Widget>[
                SwiperMe(swiperList:swiper),
                TopNavigator(navList: navigatory),
                Dophone()
              ],
            );
          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        }
      )
    );
  }
}

//轮播组件
class SwiperMe extends StatelessWidget {
  final List swiperList;
  SwiperMe({this.swiperList});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(300),
      child: Swiper(
        itemBuilder: (BuildContext context, index){
          return Image.network("${swiperList[index]['image']}",fit: BoxFit.fill);
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//首页导航组件
class TopNavigator extends StatelessWidget {
  final List navList;
  TopNavigator({this.navList});
  Widget _gridViewItem(BuildContext context,item) {
    return InkWell(
      onTap: (){print('点击我了');},
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item["title"])
        ]
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navList.map((item){
          return _gridViewItem(context,item);
        }).toList(),
      ),
    );
  }
}

class Dophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap:_launchURL,
        child: Text('拨打电话'),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:'+'13148385296';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}