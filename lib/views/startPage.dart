import 'package:flutter/material.dart';
import 'package:simple_blog_app/views/layout.dart';
import 'package:simple_blog_app/views/login.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';

final LoginController loginController = Get.put(LoginController());
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 200)),
                      Center(
                          child: Container(
                        height: 130.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('img/logo.png'))),
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80),
                    TextButton(child: 
                    Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF3A83FF)),
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:EdgeInsets.fromLTRB(50, 6, 50, 6),
                        child: Text('Get Started', 
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16),textAlign: TextAlign.center))),
                              onPressed: () => 
                                        {loginController.isUserLogedIn(),
                                          Future.delayed(Duration(milliseconds: 5000), () {
                                          if(loginController.user.value.id == null){
                                            Navigator.pushReplacement(
                                            context,   MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                          }else if(loginController.user.value.id != null){
                                            Navigator.pushReplacement(
                                            context,   MaterialPageRoute(
                                            builder: (context) => Layout()));}
                                          }
                    )}
                                      ),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
