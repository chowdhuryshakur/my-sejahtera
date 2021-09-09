import 'package:flutter/material.dart';
import 'package:simple_blog_app/views/BlogList.dart';
import 'package:simple_blog_app/views/blogDetailPage.dart';
import 'package:simple_blog_app/views/digitalHealth.dart';
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

void main() => runApp(new MaterialApp(
    title: 'Blog app',
    theme: ThemeData(
      fontFamily: 'NotoSans',
      primarySwatch: Colors.red,
      accentColor: Colors.yellowAccent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: StartPage(),
    routes: routes));
