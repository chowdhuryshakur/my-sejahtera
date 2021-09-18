import 'package:flutter/material.dart';
import 'package:simple_blog_app/views/checkIn.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/views/checkInStart.dart';
import 'package:simple_blog_app/views/startPage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

final LoginController loginController = Get.put(LoginController());
bool isload = false;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loginController.isUserLogedIn();
    Timer(Duration(seconds: 4), () => isLoggedIn());
  }

  isLoggedIn() async {
    if (loginController.user.value.id != null) {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CheckInStart()));
      });
    } else {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
