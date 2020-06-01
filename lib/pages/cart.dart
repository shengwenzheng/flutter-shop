import 'package:flutter/material.dart';
import 'package:my_shop/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import '../provide/cart.dart';
import './cart/cart_item.dart';
import './cart/cart_bottom.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车')
      ),
      body: FutureBuilder(
        future: _getCartData(context),
        builder: (context,snapshot){
          List cartList = Provide.value<CartProvide>(context).cartList;
          print(cartList);
          if(snapshot.hasData){
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context,index){
                    return CartItem(cartList[index]);
                  }
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom()
                )
              ],
            );
            
          }else{
            Text('正在加载。。。');
          }
        }
      ),
    );
  }

  Future<String> _getCartData(BuildContext context) async{
    await Provide.value<CartProvide>(context).getCartData();
    return 'end';
  }
}
