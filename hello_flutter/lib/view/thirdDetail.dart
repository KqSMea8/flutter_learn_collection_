import 'package:flutter/material.dart';

class ThirdDetail extends StatefulWidget {
  @override
  ThirdDetailState  createState() => new ThirdDetailState();
}

class ThirdDetailState extends State<ThirdDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('页面3'),
      ),
      body: new Center(
        child: new Text('页面3 详情 '),
      )
    );
  }
}