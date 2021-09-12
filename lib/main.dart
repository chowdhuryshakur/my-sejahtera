import 'package:flutter/material.dart';
import 'package:simple_blog_app/views/blogDetailPage.dart';
import 'package:simple_blog_app/views/digitalHealth.dart';
import 'package:simple_blog_app/views/splashScreen.dart';
import 'package:simple_blog_app/views/startPage.dart';
import 'package:simple_blog_app/views/status.dart';
import 'package:simple_blog_app/views/testPage.dart';
import 'package:simple_blog_app/views/vaccination.dart';

var routes = <String, WidgetBuilder>{
  "/test": (BuildContext context) => TestPage(),
  "/vaccination": (BuildContext context) => Vaccination(),
  "/status": (BuildContext context) => StatusPage(),
  "/digitalHealth": (BuildContext context) => DigitalHealth(),
  "/detail": (BuildContext context) => BlogDetailPage(),
};

void main() {
  return runApp(new MaterialApp(
    title: 'MySejahtera',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'NotoSans',
      primarySwatch: Colors.red,
      accentColor: Color(0xffEEEEEE),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: SplashScreen(),
    routes: routes));
}
