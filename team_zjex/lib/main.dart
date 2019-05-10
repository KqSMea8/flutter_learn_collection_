import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:team_zjex/utils/provider.dart';
import 'package:team_zjex/utils/shared_preferences.dart';
import 'package:team_zjex/model/search_history.dart';
import 'package:team_zjex/routers/application.dart';
import 'package:team_zjex/views/first_page/home.dart';
import 'package:team_zjex/views/welcome_page/index.dart';
import 'routers/routers.dart';
import 'routers/application.dart';

const int ThemeColor1 = 0xFFC91B3A;
const int ThemeColor = 0xFF42A5F5;
const int BgColor = 0xFFEFEFEF;
const int AccentColor = 0xFF888888;
const int FontColor = 0xFF888888;
const double FontSize = 16.0;
SpUtil sp;
var db;

void main() async {
  final provider = new Provider();
  await provider.init(true);
  sp = await SpUtil.getInstance();
  new SearchHistoryList(sp);
  db = Provider.db;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp()  {
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;
  }

  showWelcomePage() {
    // return AppPage();
    bool showWelcome = sp.getBool(SharedPreferencesKeys.showWelcome);
    if (showWelcome == null || showWelcome == true) {
      return WelcomePage();
    } else {
      return AppPage();
    }
  }
  // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(BgColor),
        accentColor: Color(AccentColor),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(FontColor), fontSize: FontSize),
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(
        body: showWelcomePage()
      ),
      onGenerateRoute: Application.router.generator,
      // navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
