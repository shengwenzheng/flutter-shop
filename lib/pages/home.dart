import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import '../service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [];
  @override
  bool get wantKeepAlive => true;

  String homeContent = '正在获取数据...';
  @override
  void initState() { 
    getHomeData().then((val){
      setState(() {
        homeContent = val.toString();
      });
    });
    // _getHotGoods();
    super.initState();
    print('重新加载了.....');
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
            var floor1Title = '第一层楼';
            return EasyRefresh(
              child:ListView(
                children: <Widget>[
                  SwiperMe(swiperList:swiper),
                  TopNavigator(navList: navigatory),
                  Recommend(recommendList:navigatory),
                  Recommend(recommendList:navigatory),
                  Recommend(recommendList:navigatory),
                  FloorTitle(imgAddress:floor1Title),
                  FloorShow(floorGoodsList: navigatory),
                  hotGoods()
                  // Dophone()
                ],
              ),
              onLoad: ()async{
                print('加载更多....');
                _getHotGoods();
              },
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

  void _getHotGoods(){
    getHotGoods().then((val){
      List<Map> newGoodsList = (val as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
      });
    });
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          width: 0.5,
          color: Colors.black12
        )
      )
    ),
    child: Text('火爆专区'),
  );

  Widget wrapList(){
    if(hotGoodsList.length > 0){
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
          onTap: (){},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 5.0),
            child: Column(
              children: <Widget>[
                Image.network(val['img'],width: ScreenUtil().setWidth(375),),
                Text(
                  val['time'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: ScreenUtil().setSp(26)
                  )
                ),
                Row(
                  children: <Widget>[
                    Text(val['time'])
                  ]
                )
              ]
            )
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else{
      return Text(' ');
    }
  }

  Widget hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          wrapList()
        ]
      ),
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
    String url = 'tel:'+'13148385296'; //打电话需要连真机
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Recommend extends StatelessWidget {
  final List recommendList;
  Recommend({this.recommendList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleRecommend(),
          _listRecommend()
        ],
      ),
    );
  }

  Widget _titleRecommend(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5,color:Colors.black12)
        )
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink)
      ),
    );
  }

  Widget _listRecommend(){
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context,index){
          return _item(index);
      }),
    );
  }

  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1,color:Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['price']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey
              ),
            )
          ]
        ),
      ),
    );
  }
}

//楼层标题
class FloorTitle extends StatelessWidget {
  final String imgAddress;
  FloorTitle({this.imgAddress});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(imgAddress),
    );
  }
}

//楼层商品组件
class FloorShow extends StatelessWidget {
  final List floorGoodsList;
  FloorShow({this.floorGoodsList});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _secondRow()
        ]
      ),
    );
  }

  Widget _firstRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2])
          ]
        )
      ]
    );
  }

  Widget _secondRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ]
    );
  }

  Widget _goodsItem(Map good){
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap:(){},
        child: Column(
          children:<Widget>[
            Image.network(good['image']),
            Text(good['title'])
          ]
        )
      ),
    );
  }
}

//火爆专区
class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}