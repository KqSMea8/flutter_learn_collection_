import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

// import 'package:team_zjex/components/category.dart';
// import '../widgets/404.dart';
// import 'package:team_zjex/components/full_screen_code_dialog.dart';
// import 'package:team_zjex/views/web_page/web_view_page.dart';
import 'package:team_zjex/views/first_page/home.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AppPage();
  },
);
 
