import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_shop/model/cart.dart';
import './cart_count.dart';

class CartItem extends StatelessWidget {
  final CartMode item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: Row(
        children: <Widget>[
          _cartCheckbox(item),
          _goodsImg(item),
          _goodsName(item),
          _goodsPrice(item)
        ]
      ),
    );
  }

  Widget _cartCheckbox(item){
    return Container(
      child: Checkbox(
        value: true, 
        activeColor: Colors.pink,
        onChanged: (bool val){}),
    );
  }

  Widget _goodsImg(item){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(
          width:1,
          color:Colors.black12
        )
      ),
      child: Image.network(item.imgUrl),
    );
  }

  Widget _goodsName(item){
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.title),
          CartCount()
        ]
      ),
    );
  }

  Widget _goodsPrice(item){
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('¥ ${item.payPrice}'),
          Container(
            child: InkWell(
              onTap: (){},
              child: Icon(
                Icons.delete_forever,
                color:Colors.black26,
                size:30
              ),)
          )
        ]
      ),
    );
  }
}