
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import  '../component/list.dart';

class FirstList extends StatefulWidget {
  @override 
  FirstListState createState() => new FirstListState();
}

class FirstListState extends State<FirstList> {
  @override 
  // TODO: implement widget
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('界面1')
      ),
      body: new Center(
        child: new List()
      )
    );
  }
}

