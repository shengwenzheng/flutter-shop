import 'package:flutter/material.dart';
import 'package:my_shop/pages/detail.dart';
import './pages/index.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/detail.dart';
import 'package:fluro/fluro.dart';
import './router/routers.dart';
import './router/app.dart';

void main(){
  var counter = Counter();
  var childCategory = ChildCategory();
  var detailPrivide = DetailPrivide();
  var providers = Providers();
  providers
  ..provide(Provider<Counter>.value(counter))
  ..provide(Provider<ChildCategory>.value(childCategory))
  ..provide(Provider<DetailPrivide>.value(detailPrivide));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    App.router = router;
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: App.router.generator,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage()
      ),
    );
  }
}






