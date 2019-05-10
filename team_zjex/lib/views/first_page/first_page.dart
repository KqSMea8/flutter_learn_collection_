import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_preferences.dart';

SpUtil sp;
// ValueKey<String> key;

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> _unKnow;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    // super.widget;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('页面2'),
        ),
        body: new Center(
          child: 
            creatButton(context, '重置', Icons.add_circle_outline, 'start'),
        )
    );
  } 
    
  Widget creatButton(
    BuildContext context, String txt, IconData iconName, String type) {
    return RaisedButton.icon(
        onPressed: () async {
          if (type == 'start') {
            await SpUtil.getInstance()
              ..putBool(SharedPreferencesKeys.showWelcome, true);
            // _goHomePage(context);
          }  
        },
        elevation: 10.0,
        color: Colors.black26,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0))),
        //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
        icon: Icon(iconName, color: Colors.white, size: 14.0),
        label: Text(
          txt,
          maxLines: 1,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        ));
  }
}
