import 'dart:async';

import 'package:flutter/material.dart'; 
import '../../utils/shared_preferences.dart';

SpUtil sp;
class FourthPage extends StatefulWidget {
  @override
  FourthPageState createState() => new FourthPageState();
}

class FourthPageState extends State<FourthPage> with TickerProviderStateMixin {
  

  int activeIndex = 0; 
  int nextPageIndex = 0;
  int waitingNextPageIndex = -1;

  double slidePercent = 0.0;

  FourthPageState() { 
    // 
  }

  @override
  void dispose() {
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Container(
          child: loadFullScreenImg('assets/img/start.png')
        ),        
        new Center(
          child: creatButton(context, '开始使用', Icons.add_circle_outline, 'start'), 
        ),
        // new Page(
        //   // page 的主要内容
        //   viewModel: pages[activeIndex],
        //   percentVisible: 1.0,
        // ),
        
      ],
    );
  }
  Widget loadFullScreenImg(String path) {
    return  new ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: new Image.asset(
      path,
        fit: BoxFit.fill,
      ),
    );
  }
  Widget loadImage(String path){
    return Container(
      child: Center(
        child: Text(
          '.',
          style: TextStyle(color: Colors.red),
        ),
      ),
      height: 800.0,
      width: 400.0,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        image: DecorationImage(
            image: AssetImage(path), fit: BoxFit.cover),
      ),
      margin: const EdgeInsets.only(top: 10.0),
    );
  }

  Widget creatButton(
    BuildContext context, String txt, IconData iconName, String type) {
    return RaisedButton.icon(
        onPressed: () async {
          if (type == 'start') {
            await SpUtil.getInstance()
              ..putBool(SharedPreferencesKeys.showWelcome, false);
            _goHomePage(context);
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

  
  _goHomePage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }
}
