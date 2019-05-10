import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './view/firstList.dart';
import './view/secondDetail.dart';
import './view/thirdDetail.dart';

void main() => runApp(
  new MaterialApp(
    home:    MyApp(),
    routes: <String, WidgetBuilder> {
      '/first': (BuildContext context) => new FirstList(),
      '/second': (BuildContext context) => new SecondDetail(),
      '/third': (BuildContext context) => new ThirdDetail()
    }
  )

);


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 演示',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyApp1(title: 'demo flutter'),
    );
  }
}

class MyApp1 extends StatefulWidget {

  MyApp1({this.title});

  final String title;

  @override
  MyAppState createState() => new MyAppState();

}

class MyAppState extends State<MyApp1> with SingleTickerProviderStateMixin {
  TabController appController;

  @override 
  void initSate(){
    appController = new TabController(vsync: this, length: 3);
  }

  @override 
  void dispose(){
    appController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
      return new DefaultTabController(
        length: 3,
        child: buildScaffold(),
      );
    }

    Widget buildScaffold(){
      return Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          bottom: buildTabBar(),
        ),
        body: buildBody(),
      );
    }

    Widget buildTabBar() {
      return TabBar(
        tabs: <Widget>[
          Icon(Icons.home),
          Icon(Icons.satellite),
          Icon(Icons.shop),
        ],

      );
    }

    Widget buildBody() {
      return TabBarView(
          children: <Widget>[
            Center(child: new FirstList()),
            Center(child: new SecondDetail()),
            Center(child: new ThirdDetail()),
          ]
      );
    }


}

  