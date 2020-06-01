import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/detail.dart';
import './detail/detail_top.dart';
import './detail/detail_tabbar.dart';
import './detail/detail_web.dart';
import './detail/detail_bottom.dart';

class Detail extends StatelessWidget {
  final String goodsId;
  Detail(this.goodsId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        )
      ),
      body: FutureBuilder(
        future: _getDetail(context),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    DetailTop(),
                    DetailTabBar(),
                    DetailWeb()
                  ]
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailBottom()
                )
              ],
            );
          }else{
            return Text('加载中');
          }
        }
      )
    );
  }

  Future _getDetail(BuildContext context) async{
    await Provide.value<DetailPrivide>(context).getSongDetail();
    return '加载完成';
  }
}