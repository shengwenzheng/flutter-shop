import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:<Widget>[
            Number(),
            Button()
          ]
        )
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200.0),
      child: Provide<Counter>(
        builder: (context,child,counter){
          return Text(
            '${counter.value}',
             style: Theme.of(context).textTheme.display1,
          );
        }
      )
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('递增'),
        onPressed: (){
          Provide.value<Counter>(context).increment();
        })
    );
  }
}