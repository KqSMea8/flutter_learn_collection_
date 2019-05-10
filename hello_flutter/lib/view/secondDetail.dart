
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondDetail extends StatefulWidget {

  @override
  SecondDetailState createState() => new SecondDetailState();
}

class SecondDetailState extends State<SecondDetail> {

  @override 
  // TODO: implement widget
  Widget build(BuildContext context){
    // super.widget;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('页面2'),
        ),
        body: new Center(
          child: new Text('页面2 详情 '),
        )
    );
  } 
}